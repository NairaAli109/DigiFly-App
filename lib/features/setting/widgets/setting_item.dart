import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.isArrowBack,
      required this.isLangButton});

  final String icon;
  final String text;
  final VoidCallback onTap;
  final bool isArrowBack;
  final bool isLangButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.veryLightGreyColor,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Image.asset(
                    icon,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.lightGreenColor,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                text.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.blackColor),
              ),
              const Spacer(),
              isArrowBack
                  ? isLangButton
                      ? Row(
                          children: [
                            Text(
                              Get.locale == const Locale("ar")
                                  ? "العربية"
                                  : 'English',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.lightGreenColor),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                            ),
                          ],
                        )
                      : Icon(
                          Icons.arrow_forward_ios,
                          size: 15.r,
                        )
                  : const SizedBox(),
            ],
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
