// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:digifly_task/core/file_services/file_services.dart';
import 'package:digifly_task/core/file_services/get_file_path.dart';

class WriteToJsonFile {
  static Future<void> writeJsonFile(
      {required String fileName,required Map<String, dynamic> data}) async {
    await CopyFileFromAssets.copyFileFromAssets(fileName: fileName);
    try {
      final filePath =
          await GetFilePath.getWritableFilePath(fileName: fileName);
      final file = File(filePath);
      await file.writeAsString(jsonEncode(data), flush: true);
    } catch (e) {
      print("Error writing to file: $e");
    }
  }
}
