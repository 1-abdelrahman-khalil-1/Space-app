import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  @override
  const CustomIcon(
      {super.key,
      this.selected = false,
      required this.approuter,
      required this.image,
      required this.imageBold});
  final String image, imageBold;
  final bool selected;
  final String approuter;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.ease,
        child: selected
            ? SizedBox(
                width: 50.w,
                child: Image.asset(
                  imageBold,
                  color: Colors.white,
                  height: 30.h,
                ),
              )
            : SizedBox(
                width: 50.w,
                child: Image.asset(
                  image,
                  color: Colors.white,
                  height: 30.h,
                )));
  }

  CustomIcon copyWith({bool? selected}) {
    return CustomIcon(
      image: image,
      selected: selected ?? this.selected,
      imageBold: imageBold,
      approuter: approuter,
    );
  }
}
