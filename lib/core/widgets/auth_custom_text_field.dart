import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthCustomTextField extends StatelessWidget {
  const AuthCustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.icon,
      required this.validator,
      required this.isPassword,
      this.suffixIconTap,
      this.passwordVisibility});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String icon;
  final FormFieldValidator validator;
  final bool isPassword;
  final bool? passwordVisibility;
  final VoidCallback? suffixIconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: isPassword && !passwordVisibility!,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.lightBlackColor,
            ),
            prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(
                  end: 2.5.w, top: 8.h, bottom: 16.h),
              child:Image.asset(icon,width: 15.w,height: 15.h,),
            ),
            suffixIcon: isPassword
                ? SizedBox(
                    width: 5.w,
                    height: 5.h,
                    child: IconButton(
                        onPressed: suffixIconTap,
                        icon: passwordVisibility!
                            ?  const Icon(Icons.visibility,color: AppColors.lightGreyColor,)
                            : Image.asset(Assets.imagesEyeVisibilityIcon,width:20.w ,height: 14.27.h,)),
                  )
                : const SizedBox(),
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
        SizedBox(height: 24.h),
      ],
    );
  }
}
