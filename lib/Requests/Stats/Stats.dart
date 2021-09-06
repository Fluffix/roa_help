import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/main.dart';

Future<StatsSerialise> getStats({String loadedToken, String date}) async {
  try {
    final String url = '$apiURL/stats';
    String token = loadedToken ?? await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
    Map<String, dynamic> jsonMap = json.decode(response.body);
    StatsSerialise db = StatsSerialise.fromJson(jsonMap);
    log(response.body);
    return db;
  } catch (e) {
    print(e);
    return null;
  }
}
