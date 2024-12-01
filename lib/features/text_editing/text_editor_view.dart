// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/text_editing/widgets/editor_header_text.dart';
import 'package:digifly_task/features/text_editing/widgets/editor_text_field.dart';
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

  void _undo() {
    if (_historyIndex > 0) {
      setState(() {
        _historyIndex--;
        _updateControllerText(); // تحديث الحقل النصي
      });
      print('Undo -> History: $_history');
      print('Undo -> Current Index: $_historyIndex');
    } else {
      print('Undo -> No action performed');
    }
  }

  void _redo() {
    // تأكد أن هناك خطوة يمكن القيام بها
    if (_historyIndex < _history.length - 1) {
      setState(() {
        _historyIndex++; // الانتقال إلى النص التالي في القائمة
        _updateControllerText(); // تحديث النصوص في الحقل النصي
      });
      print('Redo -> History: $_history');
      print('Redo -> Current Index: $_historyIndex');
    } else {
      // لا يوجد نص يمكن إعادة التقدم إليه
      print('Redo -> No action performed');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Nothing found to redo"),
        duration: Duration(milliseconds: 1500),
      ));
    }
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

  bool _isUpdatingText = false;
  void _addBulletPoint() {
    setState(() {
      final text = _controller.text;
      final newText = "$text • "; // إضافة نقطة في بداية السطر
      _controller.text = newText;
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    });
  }

  int _bulletCount = 1; // لحساب النقاط أو الأرقام في القائمة

  void _addNumberedPoint() {
    setState(() {
      final text = _controller.text;
      final newText = "$text .$_bulletCount "; // إضافة رقم في بداية السطر
      _controller.text = newText;
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
      _bulletCount++; // زيادة الرقم
    });
  }

  void _onTextChanged(String text) {
    if (!_isUpdatingText) {
      // إضافة النصوص فقط إذا كانت مختلفة عن النص الأخير
      if (_history.isEmpty || text != _history.last) {
        if (_historyIndex < _history.length - 1) {
          _history.removeRange(_historyIndex + 1, _history.length);
        }
        _history.add(text);
        _historyIndex = _history.length - 1;
      }
    }
    print('Text Changed -> History: $_history');
    print('Text Changed -> Current Index: $_historyIndex');
  }

  void _updateControllerText() {
    _isUpdatingText = true; // منع تشغيل الاستماع أثناء التحديث
    _controller.value = TextEditingValue(
      text: _history[_historyIndex],
      selection:
          TextSelection.collapsed(offset: _history[_historyIndex].length),
    );
    _isUpdatingText = false; // انتهاء التحديث
    print('Updated Controller Text: ${_controller.text}');
  }

  @override
  void initState() {
    super.initState();
    _history.add(_controller.text); // تسجيل النص الأولي
    _historyIndex = 0; // ضبط المؤشر
    _controller.addListener(() {
      _onTextChanged(_controller.text);
      setState(() {
        _wordCount;
      });
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
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.textEditorFieldColor,
                    border:
                        Border.all(color: AppColors.textEditorFieldBorderColor),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: _changeTextAlignToLeft,
                            icon: const Icon(Icons.format_align_left)),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _changeTextAlignToCenter,
                            icon:
                                const Icon(Icons.format_align_center_outlined)),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _changeTextAlignToRight,
                            icon: const Icon(Icons.format_align_right)),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _addBulletPoint,
                            icon: const Icon(Icons.format_list_bulleted_sharp)),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _addNumberedPoint,
                            icon: const Icon(
                                Icons.format_list_numbered_outlined)),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _toggleBold,
                            icon: Icon(
                              Icons.format_bold,
                              color: _isBold
                                  ? AppColors.blackColor
                                  : AppColors.lightBlackColor,
                            )),
                        VerticalDivider(
                            color: AppColors.textEditorFieldBorderColor),
                        IconButton(
                            onPressed: _toggleUnderline,
                            icon: Icon(
                              Icons.format_underline,
                              color: _isUnderline
                                  ? AppColors.blackColor
                                  : AppColors.lightBlackColor,
                            ))
                      ],
                    ),
                  ),
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
