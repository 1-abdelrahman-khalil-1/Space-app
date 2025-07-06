import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Features/Planet%20Description/data/models/planet_model/planet_model.dart';
import 'package:space_app/Features/Planet%20Description/presentation/view/widgets/video_player.dart';


import '../../../../../Core/utils/appcolors.dart';
import '../../../../../Core/utils/apptextstyles.dart';

class PlanetNameAndInfo extends StatelessWidget {
  const PlanetNameAndInfo({super.key, required this.planet, required this.planetmodel});
  final Planet planet;
  final PlanetModel planetmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              planet.name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              planet.subtitle,
              style: Apptextstyles.medium16.copyWith(
                color: Appcolors.lightBlueText,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'About ',
                  style: Apptextstyles.medium16.copyWith(
                    color: Appcolors.lightBlueText,
                  ),
                ),
                Text(
                  planet.name,
                  style: Apptextstyles.bold16.copyWith(
                    color: Appcolors.lightBlueText,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              planet.about,
              style: Apptextstyles.regular16,
            ),
            SizedBox(height: 16.h),
            VideoPlayer(),
            SizedBox(height: 16.h),
            _buildAboutSection(
              title: "Distance from Sun: ", 
              value: "${(planetmodel.semimajorAxis! / 1000000).toStringAsFixed(1)} million km"
            ),
            SizedBox(height: 8.h),
            _buildAboutSection(title: "Length of the day: ", value: _formatRotationTime(planetmodel.sideralRotation!)),
            SizedBox(height: 8.h),
            _buildAboutSection(title: "Length of the year: ", value: "${planetmodel.sideralOrbit} days"),
            SizedBox(height: 8.h),
            _buildAboutSection(title: "Radius: ", value: "${planetmodel.meanRadius } km"),
            SizedBox(height: 8.h),
            _buildAboutSection(title: "Density: ", value: "${planetmodel.density } g/cm³"),
            SizedBox(height: 8.h),
            _buildAboutSection(title: "Gravity: ", value: "${planetmodel.gravity } m/s²"),
            SizedBox(height: 54.h),

          ],
        ),
      ),
    );
  }

  Row _buildAboutSection({required String title , required String value}) {
    return Row(
            children: [
              Text(title ,
                  style: Apptextstyles.regular16.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white)),
              Text(
                value,
                style: Apptextstyles.regular16.copyWith(color: Colors.white),
              )
            ],
          );
  }

  String _formatRotationTime(double hours) {
    int totalMinutes = (hours * 60).round();
    int days = totalMinutes ~/ (24 * 60);
    int remainingMinutes = totalMinutes % (24 * 60);
    int remainingHours = remainingMinutes ~/ 60;
    int minutes = remainingMinutes % 60;
    
    String result = '';
    if (days > 0) {
      result += '${days}d ';
    }
    if (remainingHours > 0 || days > 0) {
      result += '${remainingHours}h ';
    }
    if (minutes > 0 || remainingHours > 0 || days > 0) {
      result += '${minutes}m';
    }
    return result.trim();
  }
}
