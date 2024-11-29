import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LeftAlignmentButton extends StatefulWidget {
  const LeftAlignmentButton({super.key, required this.leftAlign});

  final VoidCallback leftAlign;


  @override
  State<LeftAlignmentButton> createState() => _LeftAlignmentButtonState();
}

class _LeftAlignmentButtonState extends State<LeftAlignmentButton> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: widget.leftAlign,
            icon: const Icon(Icons.format_align_left)),
        VerticalDivider(color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
