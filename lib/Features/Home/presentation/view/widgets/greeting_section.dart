import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/appcolors.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi Explorer,',
          style: Apptextstyles.regular16.copyWith(
            color: Appcolors.lightBlueText,
            height: 1.2,
            letterSpacing: -1.12,
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: 303.w,
          child: Text(
            'Which planet\nwould you like to explore?',
            style: Apptextstyles.bold20.copyWith(
              color: Colors.white,
              height: 1.8,
              letterSpacing: -0.6,
            ),
          ),
        ),
      ],
    );
  }
}
