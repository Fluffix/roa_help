import 'dart:convert';

import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/main.dart';

Future<StatsSerialise> getStats() async {
  try {
    final String url = '$apiURL/stats';
    var http;
    var response = await http.get(url);
    int statusCode = response.statusCode;
    Map<String, dynamic> jsonMap = json.decode(response.body);
    StatsSerialise db = StatsSerialise.fromJson(jsonMap);
    return db;
  } catch (e) {
    print(e);
  }
}
