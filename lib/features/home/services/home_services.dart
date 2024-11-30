// ignore_for_file: avoid_print

import 'package:digifly_task/core/file_services/read_json_file.dart';
import 'package:digifly_task/core/file_services/write_to_json_file.dart';

class HomeServices{
  static Future< List<dynamic>> getBestSellerData()async{
    Map<String, dynamic> jsonData =
    await ReadJsonFile.readJsonFile(fileName: 'best_seller_data.json');
    List<dynamic> bestSellerProductData=jsonData["products"] ?? [];
    return bestSellerProductData;
  }
  static Future<void> updateIsFavStatus(int index, bool newStatus) async {
    Map<String, dynamic> jsonData = await ReadJsonFile.readJsonFile(
      fileName: 'best_seller_data.json',
    );

    List<dynamic> products = jsonData['products'];
    if (index < products.length) {
      products[index]['is_fav'] = newStatus;
    }

    print("Updated product: ${products[index]}"); // طباعة للتأكد من التعديل
    await WriteToJsonFile.writeJsonFile(
      fileName: 'best_seller_data.json',
      data: jsonData,
    );
  }

}