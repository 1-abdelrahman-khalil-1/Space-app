import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanetDisplay extends StatelessWidget {
  const PlanetDisplay({super.key, required this.planetimage});
  final String planetimage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      planetimage,
      height: 240.h,
      width: 240.w,
    ));
  }
}
