import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextEditorView extends StatefulWidget {
  const TextEditorView({super.key});

  @override
  State<TextEditorView> createState() => _TextEditorViewState();
}

class _TextEditorViewState extends State<TextEditorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "text_editing".tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
    );  }
}
