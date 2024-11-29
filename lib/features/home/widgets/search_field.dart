import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
   SearchField({super.key});

 final  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey3Color, // Background color
            borderRadius: BorderRadius.circular(4.r), // Rounded corners
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none, // No border
                    hintText: 'search'.tr,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.hintGreyColor,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 7.h,
                          bottom: 14.h,
                          end: 8.w,
                          start: 14.w),
                      child: Image.asset(
                        Assets.imagesSearchIcon,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ), // Search icon
                  ),
                ),
              ),
              Container(
                color: AppColors.lightGreenColor,
                child: IconButton(
                  icon: Image.asset(
                    Assets.imagesFlterIcon,
                    width: 20.w,
                    height: 20.h,
                  ), // Filtration icon
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
