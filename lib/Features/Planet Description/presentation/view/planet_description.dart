import 'package:flutter/material.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/widgets/planet_description_body.dart';

class PlanetDescription extends StatelessWidget {
  const PlanetDescription({super.key, required this.planet});
  final Planet planet;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PlanetDescriptionBody(planet: planet),
    ));
  }
}
