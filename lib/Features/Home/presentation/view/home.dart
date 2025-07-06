import 'package:flutter/material.dart';
import 'package:space_app/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:space_app/Features/Home/presentation/view/widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
    bottomNavigationBar: const MybottomNavigationBar(selectedindex: 0),
      body: HomeBody(),
    ));
  }
}
