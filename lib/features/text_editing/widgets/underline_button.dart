import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnderlineButton extends StatefulWidget {
  UnderlineButton(
      {super.key, required this.isUnderline, required this.toggleUnderline});

  bool isUnderline;
  final VoidCallback toggleUnderline;

  @override
  State<UnderlineButton> createState() => _UnderlineButtonState();
}

class _UnderlineButtonState extends State<UnderlineButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: widget.toggleUnderline,
        icon: Icon(
          Icons.format_underline,
          color: widget.isUnderline
              ? AppColors.blackColor
              : AppColors.lightBlackColor,
        ));
  }
}
