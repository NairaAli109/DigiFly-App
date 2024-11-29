import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassButton extends StatefulWidget {
  const ForgotPassButton({super.key});

  @override
  State<ForgotPassButton> createState() => _ForgotPassButtonState();
}

class _ForgotPassButtonState extends State<ForgotPassButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "forget_pass".tr,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGreenColor),
      ),
    );
  }
}
