import 'package:digifly_task/core/file_services/read_json_file.dart';

class LoginServices{
  static Future<bool> loginUser(String email, String password) async {
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'users.json');
    List<dynamic> users = jsonData["users"];

    for (var user in users) {
      if (user["email"] == email && user["password"] == password) {
        return true;
      }
    }
    return false;
  }
}