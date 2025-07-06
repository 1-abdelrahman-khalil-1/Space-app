import 'package:flutter/material.dart';
import 'package:space_app/Features/Splash%20Screen/view/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SplashScreenBody(),
    ));
  }
}
