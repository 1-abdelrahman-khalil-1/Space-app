import 'package:flutter/material.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/planet_display.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/planet_name.dart';

class PlanetScreen extends StatelessWidget {
  const PlanetScreen(
      {super.key,
      required this.planetName,
      required this.planetSubtitle,
      required this.planetImage,
      required this.forward,
      required this.backward});

  final String planetName, planetSubtitle, planetImage;
  final void Function() forward, backward;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PlanetDisplay(
          planetimage: planetImage,
        ),
        PlanetName(
            planetName: planetName,
            planetSubtitle: planetSubtitle,
            forward: forward,
            backward: backward),
      ],
    );
  }
}
