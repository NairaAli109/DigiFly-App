import 'package:digifly_task/core/file_services/read_json_file.dart';
import 'package:digifly_task/core/file_services/write_to_json_file.dart';

class SignUpServices{
  static Future<void> addUser(Map<String, dynamic> newUser) async {
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'users.json');
    if (jsonData["users"] == null) {
      jsonData["users"] = [];
    }
    jsonData["users"].add(newUser);
    await WriteToJsonFile.writeJsonFile(fileName: 'users.json', data: jsonData);
  }
}