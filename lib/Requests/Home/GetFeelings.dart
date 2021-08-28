import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Home/GetFeelingsSerialise.dart';
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
    List<dynamic> jsonList = json.decode(response.body);
    SideEffectsCategoryiesList db =
        SideEffectsCategoryiesList.fromJson(jsonList);
    // log("$jsonList");
    return db;
  } catch (e) {
    print(e);
    return null;
  }
}
