import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RememberMeButton extends StatefulWidget {
  const RememberMeButton({super.key});

  @override
  State<RememberMeButton> createState() => _RememberMeButtonState();
}

class _RememberMeButtonState extends State<RememberMeButton> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checkBoxValue,
            onChanged: (val) {
              setState(() {
                checkBoxValue = !checkBoxValue;
                print(checkBoxValue);
              });
            }),
        Text(
          "remember_me".tr,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor),
        ),
      ],
    );
  }
}
