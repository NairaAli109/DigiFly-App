// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/text_editing/widgets/editor_header_text.dart';
import 'package:digifly_task/features/text_editing/widgets/editor_text_field.dart';
import 'package:digifly_task/features/text_editing/widgets/editor_tool_bar.dart';
import 'package:digifly_task/features/text_editing/widgets/undo_redo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextEditorView extends StatefulWidget {
  const TextEditorView({super.key});

  @override
  State<TextEditorView> createState() => _TextEditorViewState();
}

class _TextEditorViewState extends State<TextEditorView> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _history = []; // لتخزين النصوص السابقة

  int _historyIndex = -1;

  bool _isBold = false;
  void _toggleBold() {
    setState(() {
      _isBold = !_isBold;
      print(_isBold);
    });
  }

  TextAlign _textAlign = TextAlign.center;
  void _changeTextAlignToLeft() {
    setState(() {
      _textAlign = TextAlign.left;
    });
  }

  void _changeTextAlignToCenter() {
    setState(() {
      _textAlign = TextAlign.center;
    });
  }

  void _changeTextAlignToRight() {
    setState(() {
      _textAlign = TextAlign.right;
    });
  }

  bool _isUnderline = false;
  void _toggleUnderline() {
    setState(() {
      _isUnderline = !_isUnderline;
    });
  }

  //count words
  int get _wordCount {
    //removing white spaces at the start or end of the text
    String text = _controller.text.trim();
    if (text.isEmpty) {
      return 0;
    }
    //detects spaces between words or next lines [/n]
    return text.split(RegExp(r'\s+')).length;
  }

  final bool _isUpdatingText = false;

  void _onTextChanged(String text) {
    if (_isUpdatingText) {
      setState(() {
        if (_history.isEmpty || text != _history.last) {
          if (_historyIndex < _history.length - 1) {
            _history.removeRange(_historyIndex + 1, _history.length);
          }
          _history.add(text);
          _historyIndex = _history.length - 1;
        }
      });
    }
    // طباعة للتحقق من النصوص الحالية
    print('Text Changed -> History: $_history');
    print('Text Changed -> Current Index: $_historyIndex');
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onTextChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
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
      body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 40.h, start: 16.w, end: 16.w, bottom: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const EditorHeaderText(),
                    const Spacer(),
                    UndoRedoButton(
                      historyIndex: _historyIndex,
                      history: _history,
                      isUpdatingText: _isUpdatingText,
                      controller: _controller,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                EditorToolBar(
                  controller: _controller,
                  isUnderline: _isUnderline,
                  textAlign: _textAlign,
                  isBold: _isBold,
                  toggleBold: _toggleBold,
                  leftAlign: _changeTextAlignToLeft,
                  rightAlign: _changeTextAlignToRight,
                  centerAlign: _changeTextAlignToCenter,
                  toggleUnderline: _toggleUnderline,
                ),
                EditorTextField(
                  controller: _controller,
                  isUnderline: _isUnderline,
                  textAlign: _textAlign,
                  isBold: _isBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$_wordCount',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.lightGreyColor),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
