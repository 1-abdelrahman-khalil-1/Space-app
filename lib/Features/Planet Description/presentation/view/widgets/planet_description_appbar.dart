import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PlanetDescriptionAppBar extends StatelessWidget {
  const PlanetDescriptionAppBar({super.key, required this.planetImage});
 final String planetImage;
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.08),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        //  size: 18.h,
                        ))),
                Image.asset(planetImage)        
              ],
            );
  }
}