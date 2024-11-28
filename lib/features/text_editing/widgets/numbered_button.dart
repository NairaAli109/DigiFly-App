import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumberedButton extends StatefulWidget {
   NumberedButton({super.key, required this.controller});
   TextEditingController controller;


  @override
  State<NumberedButton> createState() => _NumberedButtonState();
}

class _NumberedButtonState extends State<NumberedButton> {
  int _bulletCount = 1; // لحساب النقاط أو الأرقام في القائمة

  void _addNumberedPoint() {
    setState(() {
      final text = widget.controller.text;
      final newText = "$text .$_bulletCount "; // إضافة رقم في بداية السطر
      widget.controller.text = newText;
      widget.controller.selection =
          TextSelection.collapsed(offset: widget.controller.text.length);
      _bulletCount++; // زيادة الرقم
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: _addNumberedPoint,
            icon: const Icon(
                Icons.format_list_numbered_outlined)),
        VerticalDivider(
            color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
