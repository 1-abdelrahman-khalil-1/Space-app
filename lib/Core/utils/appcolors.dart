import 'package:flutter/material.dart';

abstract class Appcolors {
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment(0.92, -0.00),
    end: Alignment(0.07, 0.72),
    colors: [
      Color(0x0000A1FE),
      Color(0x2600A1FE)
    ], // Using hex opacity directly
  );
  // Yellow color for the explore button
  static const Color exploreButtonColor = Color(0xFFE3DD4F);

  // Light blue color for subtitle text
  static const Color lightBlueText = Color(0xFFC8E7FC);
}
