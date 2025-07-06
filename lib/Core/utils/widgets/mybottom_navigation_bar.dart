import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/Core/helper%20function/customnavigationbaritems.dart';

class MybottomNavigationBar extends StatefulWidget {
  const MybottomNavigationBar({super.key, required this.selectedindex});
  final int selectedindex;
  @override
  State<MybottomNavigationBar> createState() => _MybottomNavigationBarState();
}

class _MybottomNavigationBarState extends State<MybottomNavigationBar> {
  late int _seletedindex;
  @override
  void initState() {
    super.initState();
    _seletedindex = widget.selectedindex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        decoration: BoxDecoration(
          //color: Colors.black,
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  CustomNavigationitems.items.length,
                  (index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _seletedindex = index;
                            context.go(CustomNavigationitems.items[index].approuter);
                          });
                        },
                        child: CustomNavigationitems.items[index]
                            .copyWith(selected: _seletedindex == index));
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
