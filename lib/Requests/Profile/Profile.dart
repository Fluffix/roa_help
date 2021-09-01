import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/main.dart';

Future<ProfileInfoSerialise> getProfile({String loadedToken}) async {
  try {
    final String url = "$apiURL/profile";
    String token = loadedToken ?? await getToken();
    var response = await http.get(url, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });
    Map<String, dynamic> jsonMap = json.decode(response.body);
    ProfileInfoSerialise db = ProfileInfoSerialise.fromJson(jsonMap);
    return db;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<void> changeWaterDayNorm({int waterDayNorm}) async {
  try {
    final String url = '$apiURL/profile';
    String token = await getToken();
    await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'waterDayNorm': waterDayNorm,
        }));
  } catch (e) {
    print(e);
  }
}
