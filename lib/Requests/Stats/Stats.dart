import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/main.dart';

// ignore: missing_return
Future<StatsSerialise> getStats() async {
  try {
    final String url = '$apiURL/stats';
    String token = await getToken();
    var response = await http.get(
      url,
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );

    // int statusCode = response.statusCode;
    Map<String, dynamic> jsonMap = json.decode(response.body);
    log('$jsonMap');
    StatsSerialise db = StatsSerialise.fromJson(jsonMap);
    return db;
  } catch (e) {
    print(e);
  }
}
