import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/AuthSerialise.dart';
import 'package:roa_help/main.dart';

Future<Map<String, dynamic>> authRequest({
  @required String userName,
  @required String password,
}) async {
  try {
    var result = Map<String, dynamic>();

    final String url = '$apiURL/auth';
    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';

    Response response = await http.post(url,
        headers: headers,
        body: jsonEncode(
          <String, dynamic>{
            'username': userName,
            'password': password,
          },
        ));

    result['statusCode'] = response.statusCode;

    switch (response.statusCode) {
      case 201:
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);
        result['token'] = db.token;
    }
    return result;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<Map<String, dynamic>> regRequest({
  String userName,
  String password,
  Map<String, dynamic> extra,
}) async {
  try {
    var result = Map<String, dynamic>();

    final String url = '$apiURL/register';
    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';

    Response response = await http.post(url,
        headers: headers,
        body: jsonEncode(<String, dynamic>{
          'username': userName,
          'password': password,
          'extra': extra
        }));

    result['statusCode'] = response.statusCode;

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);
        result['token'] = db.token;
    }
    return result;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<void> changePassword(
    {@required String password, @required String token}) async {
  try {
    final String url = '$apiURL/profile';
    Response response = await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'password': password,
        }));
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}
