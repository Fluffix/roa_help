import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Food/FatsCounterSerialise.dart';
import 'package:roa_help/main.dart';

// ignore: missing_return
Future<FoodList> getFood(String searchText) async {
  try {
    final String url = '$apiURL/food?query=$searchText';

    var response = await http.get(url);
    int statusCode = response.statusCode;

    if (statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      log("$jsonList");
      FoodList db = FoodList.fromJson(jsonList);
      return db;
    } else {}
  } catch (e) {
    print(e);
  }
}
