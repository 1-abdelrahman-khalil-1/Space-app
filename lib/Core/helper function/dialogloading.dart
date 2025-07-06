 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';

Widget DialogLoading(BuildContext context) {
    return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                content:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16.h),
                    Text("Loading...", 
                      style: Apptextstyles.bold14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              );
  }