import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/main.dart';

// ignore: missing_return
Future<List<FoodItem>> getFood(String searchText) async {
  try {
    if (searchText == '') {
      return [];
    }
    final String url = '$apiURL/food?text=$searchText';
    String token = await getToken();
    log(url);
    var response = await http.get(
      url,
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      GetFood db = GetFood.fromJson(jsonMap);
      log("$jsonMap");

      return db.items;
    }
  } catch (e) {
    print(e);
  }
}
