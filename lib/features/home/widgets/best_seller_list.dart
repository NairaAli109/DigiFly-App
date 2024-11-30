import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/home/services/home_services.dart';
import 'package:digifly_task/features/home/widgets/best_seller_image.dart';
import 'package:digifly_task/features/home/widgets/best_seller_shimmer.dart';
import 'package:digifly_task/features/home/widgets/discount_container.dart';
import 'package:digifly_task/features/home/widgets/fav_icon.dart';
import 'package:digifly_task/features/home/widgets/item_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BestSellerList extends StatefulWidget {
  const BestSellerList({super.key});

  @override
  State<BestSellerList> createState() => _BestSellerListState();
}

class _BestSellerListState extends State<BestSellerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: FutureBuilder(
          future: HomeServices.getBestSellerData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const BestSellerShimmer();
            } else if (snapshot.hasData && snapshot.data != null) {
              List<dynamic>? product = snapshot.data;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 253.w,
                  height: 272.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            BestSellerImage(
                                productImg: product![index]['image']),
                            DiscountContainer(
                              discount: product[index]["discount"].toString(),
                            ),
                            FavIcon(
                              product: product,
                              index: index,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ItemName(productName: product[index]["name"]),
                        Row(
                          children: [
                            Text(
                              "category".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "${product[index]["category_number"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              product[index]["price"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: AppColors.lightGreenColor,
                              ),
                            ),
                            SizedBox(width: 5.w),
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
                ),
                separatorBuilder: (context, index) => SizedBox(width: 16.h),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text(
                  "No Best Seller products yet",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyColor,
                  ),
                ),
              );
            }
          }),
    );
  }
}
