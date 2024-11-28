import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/text_editing/widgets/bold_button.dart';
import 'package:digifly_task/features/text_editing/widgets/bullet_button.dart';
import 'package:digifly_task/features/text_editing/widgets/center_alignment_button.dart';
import 'package:digifly_task/features/text_editing/widgets/left_alignment_button.dart';
import 'package:digifly_task/features/text_editing/widgets/numbered_button.dart';
import 'package:digifly_task/features/text_editing/widgets/right_alignment_button.dart';
import 'package:digifly_task/features/text_editing/widgets/underline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditorToolBar extends StatelessWidget {
  const EditorToolBar(
      {super.key,
      required this.controller,
      required this.isUnderline,
      required this.textAlign,
      required this.isBold,
      required this.toggleBold,
      required this.leftAlign,
      required this.rightAlign,
      required this.centerAlign,
      required this.toggleUnderline});

  final TextEditingController controller;
  final bool isUnderline;
  final VoidCallback toggleUnderline;

  final TextAlign textAlign;
  final VoidCallback leftAlign;
  final VoidCallback rightAlign;
  final VoidCallback centerAlign;

  final bool isBold;
  final VoidCallback toggleBold;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.textEditorFieldColor,
        border: Border.all(color: AppColors.textEditorFieldBorderColor),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            LeftAlignmentButton(
              leftAlign: leftAlign,
            ),
            CenterAlignmentButton(
              centerAlign: centerAlign,
            ),
            RightAlignmentButton(
              rightAlign: rightAlign,
            ),
            BulletButton(controller: controller),
            NumberedButton(controller: controller),
            BoldButton(
              isBold: isBold,
              toggleBold: toggleBold,
            ),
            UnderlineButton(
              isUnderline: isUnderline,
              toggleUnderline: toggleUnderline,
            ),
          ],
        ),
      ),
    );
  }
}
