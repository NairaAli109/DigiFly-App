import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RightAlignmentButton extends StatefulWidget {
  const RightAlignmentButton({super.key, required this.rightAlign});

  final VoidCallback rightAlign;


  @override
  State<RightAlignmentButton> createState() => _RightAlignmentButtonState();
}

class _RightAlignmentButtonState extends State<RightAlignmentButton> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: widget.rightAlign,
            icon: const Icon(Icons.format_align_right)),
        VerticalDivider(color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
