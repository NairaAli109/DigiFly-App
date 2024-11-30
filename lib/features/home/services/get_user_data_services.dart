import 'package:digifly_task/core/file_services/read_json_file.dart';

class GetUserDataServices {

  static Future<String?> getUserName() async {
    Map<String, dynamic> jsonData =
        await ReadJsonFile.readJsonFile(fileName: 'users.json');
    List<dynamic> users = jsonData["users"];
    String? userName;
    for (var user in users) {
      userName = user["name"];
    }
    return userName;
  }

  static Future<String?> getUserEmail() async {
    Map<String, dynamic> jsonData =
        await ReadJsonFile.readJsonFile(fileName: 'users.json');
    List<dynamic> users = jsonData["users"];
    String? userName;
    for (var user in users) {
      userName = user["email"];
    }
    return userName;
  }
}
