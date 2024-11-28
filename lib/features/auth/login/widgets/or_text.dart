import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "or".tr,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGreyColor,
      ),
    );
  }
}
