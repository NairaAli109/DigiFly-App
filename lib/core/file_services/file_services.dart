import 'dart:io';
import 'package:digifly_task/core/file_services/get_file_path.dart';
import 'package:flutter/services.dart';

class CopyFileFromAssets {
  static Future<void> copyFileFromAssets({required String fileName}) async {
    final filePath = await GetFilePath.getWritableFilePath(fileName: fileName);
    final file = File(filePath);

    if (!(await file.exists())) {
      final data = await rootBundle.loadString('assets/json_files/$fileName');
      await file.writeAsString(data);
    }
  }
}
