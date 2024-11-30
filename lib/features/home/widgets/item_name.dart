import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemName extends StatelessWidget {
  const ItemName({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName.tr,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: AppColors.blackColor,
      ),
    );
  }
}
