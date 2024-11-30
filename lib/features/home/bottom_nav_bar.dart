// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/home/home_view.dart';
import 'package:digifly_task/features/setting/setting_view.dart';
import 'package:digifly_task/features/text_editing/text_editor_view.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.navigatedIndex});
  static const String id = "/BottomNavBar";
  final int? navigatedIndex;

  static void switchToTab(BuildContext context, int index) {
    final _BottomNavBarState? state =
    context.findAncestorStateOfType<_BottomNavBarState>();
    state?.updateSelectedIndex(index);
  }

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late int _currentIndex ;

  void updateSelectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.navigatedIndex ?? 0;
  }

  final List<Widget> _screens = [
    const HomeView(),
    const TextEditorView(),
    const SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      // body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected index
            print(index);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesHomeIcon,
                width: 18.w,
                height: 20.h,
                color: _currentIndex == 0
                    ? AppColors.lightGreenColor
                    : AppColors.hintGreyColor,
              ),
              label: "home".tr),
          BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesTextEditingIvon,
                width: 18.w,
                height: 20.h,
                color: _currentIndex == 1
                    ? AppColors.lightGreenColor
                    : AppColors.hintGreyColor,
              ),
              label: "text_editing".tr),
          BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesSettingIcon,
                width: 18.w,
                height: 20.h,
                color: _currentIndex == 2
                    ? AppColors.lightGreenColor
                    : AppColors.hintGreyColor,
              ),
              label: "setting".tr),
        ],
        selectedItemColor: AppColors.lightGreenColor, // Active icon color
        unselectedItemColor: AppColors.hintGreyColor, // Inactive icon color
        showUnselectedLabels: true, // Show labels for inactive items
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
