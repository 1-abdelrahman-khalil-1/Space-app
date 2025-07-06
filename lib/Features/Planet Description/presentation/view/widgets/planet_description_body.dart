
import 'package:flutter/material.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Core/utils/appimages.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/widgets/planet_description_appbar.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/widgets/planetname_and_info_blocbuilder.dart';



class PlanetDescriptionBody extends StatelessWidget {
  const PlanetDescriptionBody({super.key, required this.planet});
  final Planet planet;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.assetsImagesSkyBackground), fit: BoxFit.fill)),
        child: Stack(
          children: [
            PlanetDescriptionAppBar(planetImage: planet.imageWithoutMoon),
            PlanetnameAndInfoBlocbuilder(planet: planet),
          ],
        ),
      ),
    );
  }
}
