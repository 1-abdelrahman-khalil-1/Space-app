import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/appcolors.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';

class PlanetInfoSection extends StatelessWidget {
  const PlanetInfoSection(
      {super.key, required this.planetName, required this.planetSubtitle});
  final String planetName, planetSubtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 125.w,
          child: Text(
            planetName,
            textAlign: TextAlign.center,
            style: Apptextstyles.bold24.copyWith(
              color: Colors.white,
              height: 1.20,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          planetSubtitle,
          style: Apptextstyles.regular14.copyWith(
            color: Appcolors.lightBlueText,
            height: 1.20,
          ),
        ),
      ],
    );
  }
}
