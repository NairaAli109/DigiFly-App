import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileSideText extends StatelessWidget {
  const ProfileSideText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.darkGreyColor),
    );
  }
}
