import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerImage extends StatelessWidget {
  const BestSellerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 198.h,
      color: AppColors.lightWhiteColor,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 39.h, bottom: 39.h, start: 64.77.w, end: 64.77.w),
        child: Image.asset(
          Assets.imagesBoxImage,
          width: 107.46.w,
          height: 120.h,
        ),
      ),
    );
  }
}
