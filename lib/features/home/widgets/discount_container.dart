import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Text(
          '-17%',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
