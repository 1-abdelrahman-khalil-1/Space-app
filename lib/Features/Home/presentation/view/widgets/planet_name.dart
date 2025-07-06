import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/planet_info_section.dart';

class PlanetName extends StatelessWidget {
  const PlanetName(
      {super.key,
      required this.planetName,
      required this.planetSubtitle,
      required this.forward,
      required this.backward});
  final String planetName, planetSubtitle;
  final void Function() forward, backward;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left navigation indicator
        IconButton(
            onPressed: () {
              backward();
            },
            icon: _build_icon(Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 18,
            ))),
        PlanetInfoSection(
          planetName: planetName,
          planetSubtitle: planetSubtitle,
        ),
        // Right navigation indicator
        IconButton(
            onPressed: () {
              forward();
            },
            icon: _build_icon(Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 18,
            ))),
      ],
    );
  }

  Container _build_icon(Widget child) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: child,
    );
  }
}
