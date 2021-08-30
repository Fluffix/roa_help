import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/main.dart';

Future<dynamic> getProfile() async {
  try {
    final String url = "$apiURL/profile";
    String token = await getToken();
    var response = await http.get(url, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });

    Map<String, dynamic> jsonMap = json.decode(response.body);
    ProfileInfo db = ProfileInfo.fromJson(jsonMap);
    return db;
  } catch (e) {
    print(e);
  }
}
