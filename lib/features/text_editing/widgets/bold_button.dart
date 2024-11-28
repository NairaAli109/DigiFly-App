// ignore_for_file: must_be_immutable

import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

class BoldButton extends StatefulWidget {
  const BoldButton({super.key, required this.isBold, required this.toggleBold});

  final bool isBold;
  final VoidCallback toggleBold;
  @override
  State<BoldButton> createState() => _BoldButtonState();
}

class _BoldButtonState extends State<BoldButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: widget.toggleBold,
            icon: Icon(
              Icons.format_bold,
              color: widget.isBold ? AppColors.blackColor : AppColors.lightBlackColor,
            )),
        VerticalDivider(color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
