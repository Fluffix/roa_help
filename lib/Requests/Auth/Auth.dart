import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/AuthSerialise.dart';
import 'package:roa_help/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> authRequest({String userName, String password}) async {
  try {
    final String url = '$apiURL/auth';
    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';

    Response response = await http.post(url,
        headers: headers,
        body: jsonEncode(<String, dynamic>{
          'username': userName,
          'password': password,
        }));

    switch (response.statusCode) {
      case 201:
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);
        saveUser(db.token);
    }
    return response.statusCode;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<int> regRequest({
  String userName,
  String password,
  Map<String, dynamic> extra,
}) async {
  try {
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

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);
        saveUser(db.token);
    }
    return response.statusCode;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<String> getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('token');
}

Future<void> saveUser(String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('token', token);
}

Future<void> removeToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove('token');
}
