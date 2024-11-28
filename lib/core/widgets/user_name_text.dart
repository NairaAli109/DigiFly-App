import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({super.key, required this.fontSize});

  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "ahmed_alaa".tr,
      style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor),
    );
  }
}
