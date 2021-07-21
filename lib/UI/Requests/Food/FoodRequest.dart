import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roa_help/UI/Requests/Food/GetFood.dart';
import 'package:roa_help/main.dart';

// ignore: missing_return
Future<GetFood> getFood(String searchText) async {
  try {
    final String url = '${apiURL}food/$searchText';

    var response = await http.get(url);
    int statusCode = response.statusCode;

    String jsonR = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonR);
    GetFood db = GetFood.fromJson(jsonMap);

    return db;
  } catch (e) {
    print(e);
  }
}
