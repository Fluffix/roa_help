import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/main.dart';

Future<ProfileInfoSerialise> getProfile({@required String token}) async {
  try {
    final String url = "$apiURL/profile";
    var response = await http.get(Uri.parse(url), headers: {
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

Future<void> changeWaterDayNorm({
  @required int waterDayNorm,
  @required String token,
}) async {
  try {
    final String url = '$apiURL/profile';
    await http.post(Uri.parse(url),
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
