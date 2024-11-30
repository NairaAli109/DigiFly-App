import 'package:path_provider/path_provider.dart';

class GetFilePath {
  static Future<String> getWritableFilePath({required String fileName}) async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName";
  }
}
