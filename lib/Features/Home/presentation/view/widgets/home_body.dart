import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/model/planet.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/explore_button.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/planet_screen.dart';

import 'app_header.dart';
import 'greeting_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Planet> planets = Planet.planets;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPageIndex < planets.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            SizedBox(height: 32.h),
            const GreetingSection(),
            SizedBox(
              height: 500.h,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: planets.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return PlanetScreen(
                    planetName: planets[index].name,
                    planetSubtitle: planets[index].subtitle,
                    planetImage: planets[index].imageWithMoon,
                    forward: _goToNextPage,
                    backward: _goToPreviousPage,
                  );
                },
              ),
            ),
            ExploreButton(
              planet: planets[_currentPageIndex],
            ),
     
          ],
        ),
      ),
    );
  }
}
