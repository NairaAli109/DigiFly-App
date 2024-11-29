import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingHeaderText extends StatelessWidget {
  const SettingHeaderText({super.key, required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText.tr,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
    );
  }
}
