import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileEditingField extends StatelessWidget {
  const ProfileEditingField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
     this.onEditingComplete,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final VoidCallback? onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onEditingComplete: onEditingComplete,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.lightBlackColor,
            ),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyColor)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyColor)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.redColor)),
          ),
          validator: validator,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
