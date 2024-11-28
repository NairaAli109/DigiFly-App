import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CenterAlignmentButton extends StatefulWidget {
  const CenterAlignmentButton({super.key, required this.centerAlign});

  final VoidCallback centerAlign;


  @override
  State<CenterAlignmentButton> createState() => _CenterAlignmentButtonState();
}

class _CenterAlignmentButtonState extends State<CenterAlignmentButton> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: widget.centerAlign,
            icon: const Icon(Icons.format_align_center_outlined)),
        VerticalDivider(color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
