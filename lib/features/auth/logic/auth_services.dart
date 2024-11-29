import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AuthServices {
  static Future<String> _getWritableFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/users.json";
  }

  static Future<void> _copyFileFromAssets() async {
    final filePath = await _getWritableFilePath();
    final file = File(filePath);

    // تحقق إذا كان الملف موجودًا
    if (!(await file.exists())) {
      // إذا لم يكن موجودًا، قم بنسخه من assets
      final data = await rootBundle.loadString('assets/json_files/users.json');
      await file.writeAsString(data);
    }
  }

  // قراءة البيانات من الملف
  static Future<Map<String, dynamic>> readJsonFile() async {
    await _copyFileFromAssets(); // تأكد من أن الملف موجود
    try {
      final filePath = await _getWritableFilePath();
      final file = File(filePath);

      if (await file.exists()) {
        String content = await file.readAsString();
        return jsonDecode(content);
      }
    } catch (e) {
      print("Error reading file: $e");
    }
    return {"users": []}; // بيانات فارغة في حال وجود خطأ
  }

  // كتابة البيانات إلى الملف
  static Future<void> writeJsonFile(Map<String, dynamic> data) async {
    await _copyFileFromAssets(); // تأكد من وجود الملف
    try {
      final filePath = await _getWritableFilePath();
      final file = File(filePath);
      await file.writeAsString(jsonEncode(data), flush: true);
    } catch (e) {
      print("Error writing to file: $e");
    }
  }

  // إضافة مستخدم جديد
  static Future<void> addUser(Map<String, dynamic> newUser) async {
    Map<String, dynamic> jsonData = await readJsonFile();
    jsonData["users"].add(newUser);
    await writeJsonFile(jsonData);
  }

  // التحقق من بيانات تسجيل الدخول
  static Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> jsonData = await readJsonFile();
    List<dynamic> users = jsonData["users"];

    for (var user in users) {
      if (user["email"] == email && user["password"] == password) {
        return true; // تسجيل دخول ناجح
      }
    }
    return false; // بيانات غير صحيحة
  }
}
