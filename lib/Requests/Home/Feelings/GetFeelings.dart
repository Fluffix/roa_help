import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';
import 'dart:convert';

import 'package:roa_help/main.dart';

Future<SideEffectsCategoryiesList> getSideEffects() async {
  try {
    final String url = '$apiURL/side_effects';
    String token = await getToken();

    var response = await http.get(url, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });
    Map<String, dynamic> jsonMap = json.decode(response.body);
    SideEffectsCategoryiesList db =
        SideEffectsCategoryiesList.fromJson(jsonMap);
    return db;
  } catch (e) {
    print(e);
    return null;
  }
}
