import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/Core/utils/appimages.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.assetsImagesLogo,
      width: 60.w,
    );
  }
}
