import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/AuthSerialise.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

Future<int> authRequest(
    {String userName,
    String password,
    Map<String, dynamic> extra,
    String auth}) async {
  try {
    final String url = '$apiURL/$auth';
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
        _saveUser(db.token);
    }
    print(response.body);
    return response.statusCode;
  } catch (e) {
    print(e);
  }
}

Future<void> _saveUser(String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('token', token);
}
