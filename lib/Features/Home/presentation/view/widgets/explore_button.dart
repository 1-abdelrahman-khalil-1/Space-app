import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Core/utils/appcolors.dart';
import 'package:space_app/Core/utils/approuter.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit.dart';

class ExploreButton extends StatelessWidget {
  final Planet planet;

  const ExploreButton({
    super.key,
    required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PlanetCubit>().getPlanetDetails(planetName: planet.name);
        context.read<PlanetVideoCubit>().getPlanetVideo(planetName: planet.name);
        context.push(
          Approuter.planet_description,
          extra: planet,
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: ShapeDecoration(
          color: Appcolors.exploreButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(52.r),
          ),
        ),
        child: Center(
          child: Text(
            'Explore ${planet.name.toLowerCase()}',
            style: Apptextstyles.medium16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
