import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthAnotherOptionText extends StatelessWidget {
  const AuthAnotherOptionText({super.key, required this.text, required this.buttonText, required this.onTap});

  final String text;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.tr,
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
                onPressed: onTap,
                child: Text(
                  buttonText.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.lightGreenColor,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
