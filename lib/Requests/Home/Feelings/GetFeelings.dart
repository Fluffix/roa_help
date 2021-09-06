import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';
import 'dart:convert';

import 'package:roa_help/main.dart';

Future<SideEffectsCategoryiesList> getSideEffects(
    {@required String token}) async {
  try {
    final String url = '$apiURL/side_effects';

    var response = await http.get(Uri.parse(url), headers: {
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
