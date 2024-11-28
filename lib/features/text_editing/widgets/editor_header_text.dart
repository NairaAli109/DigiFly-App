import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditorHeaderText extends StatelessWidget {
  const EditorHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      "intro_your_self".tr,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: AppColors.blackColor),
    );
  }
}
