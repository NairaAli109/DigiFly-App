import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.lightGreenColor,
        ),
        child: Center(
          child: Text(
            text.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
