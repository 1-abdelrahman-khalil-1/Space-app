import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/helper%20function/dialogloading.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit_state.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/widgets/planetname_and_info.dart';

class PlanetnameAndInfoBlocbuilder extends StatefulWidget {
  const PlanetnameAndInfoBlocbuilder({super.key, required this.planet});
  final Planet planet;

  @override
  State<PlanetnameAndInfoBlocbuilder> createState() => _PlanetnameAndInfoBlocbuilderState();
}

class _PlanetnameAndInfoBlocbuilderState extends State<PlanetnameAndInfoBlocbuilder> {
  bool _isLoading = true;
  late PlanetCubitState _lastState;

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  void _startLoadingTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetCubit, PlanetCubitState>(
      builder: (context, state) {
        // Store the last non-loading state to use after the timer completes
        if (state is! PlanetDetailsLoading) {
          _lastState = state;
        }
        
        // Show loading if we're within the 3 second window or actually loading
        if (_isLoading || state is PlanetDetailsLoading) {
          log('Loading planet details for: ${widget.planet.name}');
          return DialogLoading(context);
        }
        
        // After loading timer, use the last known state
        if (_lastState is PlanetDetailsLoaded) {
          log('Planet details loaded successfully: ${widget.planet.name}');
          return PlanetNameAndInfo(
            planetmodel: (_lastState as PlanetDetailsLoaded).planet, 
            planet: widget.planet
          );
        } else if (_lastState is PlanetError) {
          log('Error loading planet details: ${(_lastState as PlanetError).errorMessage}');
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text("Could not load planet details", 
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text((_lastState as PlanetError).errorMessage, 
                  style: TextStyle(fontSize: 14, color: Colors.red[300]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    log('Retrying planet data fetch for: ${widget.planet.name}');
                    setState(() {
                      _isLoading = true;
                    });
                    _startLoadingTimer();
                    context.read<PlanetCubit>().getPlanetDetails(
                      planetName: widget.planet.name
                    );
                  },
                  child: Text('Retry'),
                )
              ],
            ),
          );
        } else {
          log('No data or unknown state for planet: ${widget.planet.name}');
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info_outline, size: 48, color: Colors.amber),
                SizedBox(height: 16),
                Text("No planet details available"),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    log('Initial planet data fetch for: ${widget.planet.name}');
                    setState(() {
                      _isLoading = true;
                    });
                    _startLoadingTimer();
                    context.read<PlanetCubit>().getPlanetDetails(
                      planetName: widget.planet.name
                    );
                  },
                  child: Text('Load Data'),
                )
              ],
            ),
          );
        }
      },
    );
  }
}