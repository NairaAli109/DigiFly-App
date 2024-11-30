import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/custom_shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerShimmer extends StatelessWidget {
  const BestSellerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 253.w,
      // height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 237.w,
                    height: 150.h,
                    color: Colors.grey.shade300.withOpacity(0.2),
                  ),
                ),
                Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 40.w,
                        height: 20.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    )),
                Positioned(
                    top: 16.h,
                    right: 16.h,
                    child: Shimmer.fromColors(baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,child: Icon(
                      Icons.favorite,
                      color: Colors.grey.shade300,
                      size: 30.sp,
                    ),)),
              ],
            ),
            SizedBox(height: 16.h),
            const CustomShimmerText(width: 100),
            const Row(
              children: [
                CustomShimmerText(width: 100),
                Spacer(),
                CustomShimmerText(width: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
