import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditorTextField extends StatelessWidget {
  const EditorTextField(
      {super.key,
      required this.controller,
      required this.isUnderline,
      required this.textAlign,
      required this.isBold});
  final TextEditingController controller;
  final bool isUnderline;
  final TextAlign textAlign;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          textAlign: textAlign,
          maxLines: 10,
          style: TextStyle(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.textEditorFieldColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(2.r),
                  bottomRight: Radius.circular(2.r)),
              borderSide:
                  BorderSide(color: AppColors.textEditorFieldBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2.r),
                    bottomRight: Radius.circular(2.r)),
                borderSide:
                    BorderSide(color: AppColors.textEditorFieldBorderColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2.r),
                    bottomRight: Radius.circular(2.r)),
                borderSide:
                    BorderSide(color: AppColors.textEditorFieldBorderColor)),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
