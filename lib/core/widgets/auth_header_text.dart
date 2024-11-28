import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthHeaderText extends StatelessWidget {
  const AuthHeaderText({super.key, required this.headerText});

  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(headerText.tr,
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 40.h),
      ],
    );
  }
}
