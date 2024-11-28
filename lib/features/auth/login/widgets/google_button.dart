import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        InkWell(
          onTap: () {},
          child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGreyColor),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.w, top: 12.h, bottom: 12.h, end: 110.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Image.asset(Assets.imagesGoogleLoginIcon),
                    ),
                    Text('continue_with_google'.tr),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}