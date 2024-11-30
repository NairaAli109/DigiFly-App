import 'package:digifly_task/core/file_services/read_json_file.dart';
import 'package:digifly_task/core/file_services/write_to_json_file.dart';

class UpdateUserDataServices {
  static Future<void> updateUserEmail(String newEmail) async {
    // قراءة البيانات من الملف
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'users.json');

    // تحديث البريد الإلكتروني
    List<dynamic> users = jsonData["users"] ?? [];
    if (users.isNotEmpty) {
      users[0]["email"] = newEmail;
    }

    // كتابة البيانات الجديدة إلى الملف
    await WriteToJsonFile.writeJsonFile(
      fileName: 'users.json',
      data: jsonData,
    );
  }
  static Future<void> updateUserFirstName(String firstName) async {
    // قراءة البيانات من الملف
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'users.json');

    List<dynamic> users = jsonData["users"] ?? [];
    if (users.isNotEmpty) {
      // تقسيم الاسم وتحديث الجزء الأول
      List<String> fullName = users[0]["name"].split(RegExp(r'\s+'));
      fullName[0] = firstName; // تحديث الاسم الأول
      users[0]["name"] = fullName.join(' '); // دمج الاسم الكامل مرة أخرى
    }

    // كتابة البيانات الجديدة إلى الملف
    await WriteToJsonFile.writeJsonFile(
      fileName: 'users.json',
      data: jsonData,
    );
  }

  static Future<void> updateUserLastName(String lastName) async {
    // قراءة البيانات من الملف
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'users.json');

    List<dynamic> users = jsonData["users"] ?? [];
    if (users.isNotEmpty) {
      // تقسيم الاسم وتحديث الجزء الأخير
      List<String> fullName = users[0]["name"].split(RegExp(r'\s+'));
      if (fullName.length > 1) {
        fullName[1] = lastName; // تحديث الاسم الأخير إذا كان موجودًا
      } else if (fullName.isNotEmpty) {
        fullName.add(lastName); // إضافة الاسم الأخير إذا لم يكن موجودًا
      } else {
        fullName = ["Unknown", lastName]; // التعامل مع حالة الاسم الفارغ
      }
      users[0]["name"] = fullName.join(' '); // دمج الاسم الكامل مرة أخرى
    }

    // كتابة البيانات الجديدة إلى الملف
    await WriteToJsonFile.writeJsonFile(
      fileName: 'users.json',
      data: jsonData,
    );
  }

}
