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

    if (!(await file.exists())) {
      final data = await rootBundle.loadString('assets/json_files/users.json');
      await file.writeAsString(data);
    }
  }

  static Future<Map<String, dynamic>> readJsonFile() async {
    await _copyFileFromAssets();
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

  static Future<void> writeJsonFile(Map<String, dynamic> data) async {
    await _copyFileFromAssets();
    try {
      final filePath = await _getWritableFilePath();
      final file = File(filePath);
      await file.writeAsString(jsonEncode(data), flush: true);
    } catch (e) {
      print("Error writing to file: $e");
    }
  }

  static Future<void> addUser(Map<String, dynamic> newUser) async {
    Map<String, dynamic> jsonData = await readJsonFile();
    jsonData["users"].add(newUser);
    await writeJsonFile(jsonData);
  }

  static Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> jsonData = await readJsonFile();
    List<dynamic> users = jsonData["users"];

    for (var user in users) {
      if (user["email"] == email && user["password"] == password) {
        return true;
      }
    }
    return false;
  }
}
