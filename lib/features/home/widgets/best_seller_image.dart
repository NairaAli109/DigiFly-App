import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerImage extends StatelessWidget {
  const BestSellerImage({super.key, required this.productImg});

  final String productImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 198.h,
      color: AppColors.lightWhiteColor,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 0.h, bottom: 0.h, start: 0.w, end:0.w),
        child: Image.asset(
          productImg,
          fit: BoxFit.fill,
          // width: 107.46.w,
          // height: 120.h,
        ),
      ),
    );
  }
}
