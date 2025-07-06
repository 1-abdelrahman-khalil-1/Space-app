import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/Core/utils/appcolors.dart';
import 'package:space_app/Core/utils/appimages.dart';
import 'package:space_app/Core/utils/approuter.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.assetsImagesAstronaut,
          height: 400.w,
        ),
        Center(child: SvgPicture.asset(AppImages.assetsImagesLogo)),
        SizedBox(
          height: 18.h,
        ),
        Text(
          "Knowledge",
          style: Apptextstyles.bold20,
        ),
        SizedBox(
          height: 60.h,
        ),
        GestureDetector(
          onTap: () => context.go(Approuter.home),
          child: Container(
            width: 170.w,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: Appcolors.blueGradient,
              borderRadius: BorderRadius.circular(54.r),
            ),
            child: Text(
              "Go menu",
              style: Apptextstyles.medium16,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
