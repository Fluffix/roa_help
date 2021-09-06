import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/main.dart';

Future<List<FoodItem>> getFood({
  @required String searchText,
  @required String token,
}) async {
  try {
    if (searchText == '') {
      return [];
    }
    final String url = '$apiURL/food?text=$searchText';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      GetFood db = GetFood.fromJson(jsonMap);
      return db.items;
    }
    return null;
  } catch (e) {
    print(e);
    return null;
  }
}
