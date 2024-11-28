import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BulletButton extends StatefulWidget {
   BulletButton({super.key, required this.controller});

   TextEditingController controller;

  @override
  State<BulletButton> createState() => _BulletButtonState();
}

class _BulletButtonState extends State<BulletButton> {

  void _addBulletPoint() {
    setState(() {
      final text = widget.controller.text;
      final newText = "$text • "; // إضافة نقطة في بداية السطر
      widget.controller.text = newText;
      widget.controller.selection =
          TextSelection.collapsed(offset: widget.controller.text.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: _addBulletPoint,
            icon:
            const Icon(Icons.format_list_bulleted_sharp)),
        VerticalDivider(
            color: AppColors.textEditorFieldBorderColor),
      ],
    );
  }
}
