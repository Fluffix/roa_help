import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/AuthSerialise.dart';
import 'package:roa_help/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: missing_return
Future<int> authRequest({
  String code,
}) async {
  try {
    final String url = '$apiURL/auth';
    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';

    Response response = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode(<String, dynamic>{
          'code': code,
        }));
    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);
    switch (response.statusCode) {
      case 201:
        saveUser(db.token);
        break;
      case 200:
        saveUser(db.token);
        break;
    }
    return response.statusCode;
  } catch (e) {
    print(e);
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
