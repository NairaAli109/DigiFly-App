import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileHeaderText extends StatelessWidget {
  const EditProfileHeaderText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: TextStyle(
          color: AppColors.darkGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp),
    );
  }
}
