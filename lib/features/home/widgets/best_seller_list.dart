import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/home/widgets/best_seller_image.dart';
import 'package:digifly_task/features/home/widgets/discount_container.dart';
import 'package:digifly_task/features/home/widgets/fav_icon.dart';
import 'package:digifly_task/features/home/widgets/item_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                width: 253.w,
                height: 272.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    const Stack(
                      children: [
                        BestSellerImage(),
                        DiscountContainer(),
                        FavIcon(),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const ItemName(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "category".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        Text(
                          "L.E".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: AppColors.lightGreenColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(width: 16.h),
          itemCount: 5),
    );
  }
}
