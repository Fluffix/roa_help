import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Food/FoodRequestSerialise.dart';
import 'package:roa_help/main.dart';

// ignore: missing_return
Future<List<Items>> getFood(String searchText) async {
  try {
    final String url = '$apiURL/food?query=$searchText';

    var response = await http.get(url);
    int statusCode = response.statusCode;

    if (statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      GetFood db = GetFood.fromJson(jsonMap);
      return db.items;
    } else {}
  } catch (e) {
    print(e);
  }
}
