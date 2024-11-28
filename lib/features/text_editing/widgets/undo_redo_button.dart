// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class UndoRedoButton extends StatefulWidget {
  UndoRedoButton(
      {super.key,
      required this.historyIndex,
      required this.history,
      required this.isUpdatingText,
      required this.controller});

  final List<String> history;
  bool isUpdatingText;
  int historyIndex;
  final TextEditingController controller;

  @override
  State<UndoRedoButton> createState() => _UndoRedoButtonState();
}

class _UndoRedoButtonState extends State<UndoRedoButton> {

  void _undo() {
    if (widget.historyIndex > 0) {
      setState(() {
        widget.historyIndex--;
        _updateControllerText();
      });
      print('Undo -> History: ${widget.history}');
      print('Undo -> Current Index: ${widget.historyIndex}');
    } else {
      print('Undo -> No action performed');
    }
  }

  void _updateControllerText() {
    widget.isUpdatingText = true; // ابدأ تحديث النص برمجياً
    widget.controller.value = TextEditingValue(
      text: widget.history[widget.historyIndex],
      selection: TextSelection.collapsed(
          offset: widget.history[widget.historyIndex].length),
    );
    widget.isUpdatingText = false; // انتهاء تحديث النص
    print('Updated Controller Text: ${widget.controller.text}');
  }

  void _redo() {
    if (widget.historyIndex < widget.history.length - 1) {
      setState(() {
        widget.historyIndex++;
        _updateControllerText();
      });
      print('Redo -> History: ${widget.history}');
      print('Redo -> Current Index: ${widget.historyIndex}');
    } else {
      print('Redo -> No action performed');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("nothing found to redo"),
        duration: Duration(milliseconds: 1500),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.veryLightGreyColor,
          child: IconButton(
            icon: const Icon(Icons.undo),
            onPressed: _undo,
          ),
        ),
        SizedBox(width: 3.w),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.veryLightGreyColor,
          child: IconButton(
            icon: const Icon(Icons.redo),
            onPressed: _redo,
          ),
        )
      ],
    );
  }
}
