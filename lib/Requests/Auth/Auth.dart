import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/AuthSerialise.dart';
import 'package:roa_help/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> authRequest({
  String code,
}) async {
  try {
    final String url = '$apiURL/auth';
    Map<String, String> headers = HashMap();
    headers['Content-type'] = 'application/json';

    Response response = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode(
          <String, dynamic>{
            'code': code,
          },
        ));

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    RegisrationSerialise db = RegisrationSerialise.fromJson(jsonMap);

    switch (response.statusCode) {
      case 200:
      case 201:
        saveToken(db.token);
        break;
    }
    return response.statusCode;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<void> saveToken(String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('token', token);
}

Future<void> removeToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove('token');
}
