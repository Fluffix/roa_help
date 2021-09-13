import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Food/FavoritesSerialise.dart';
import 'package:roa_help/main.dart';

Future<List<FoodItem>> getFavorites({@required String token}) async {
  try {
    final String url = "$apiURL/food/favorite";
    log('Favrites = $url');
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });
    log('${response.body}');
    Map<String, dynamic> jsonMap = json.decode(response.body);
    FavoriteFoodItems db = FavoriteFoodItems.fromJson(jsonMap);
    return db.items;
  } catch (e) {
    print(e);
    return null;
  }
}
