// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:digifly_task/core/file_services/file_services.dart';
import 'package:digifly_task/core/file_services/get_file_path.dart';

class ReadJsonFile {
  static Future<Map<String, dynamic>> readJsonFile(
      {required String fileName}) async {
    await CopyFileFromAssets.copyFileFromAssets(fileName: fileName);
    try {
      final filePath =
          await GetFilePath.getWritableFilePath(fileName: fileName);
      final file = File(filePath);

      if (await file.exists()) {
        String content = await file.readAsString();
        return jsonDecode(content);
      }
    } catch (e) {
      print("Error reading file: $e");
    }
    return {"users": []};
  }
}
