import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';

import '../../main.dart';

Future<void> waterRequest({double wasDrinked}) async {
  try {
    final String url = '$apiURL/water';
    String token = await getToken();
    Response response = await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'water': wasDrinked,
        }));

    switch (response.statusCode) {
      case 200:
        print(response.body);
    }
    print(response.body);
  } catch (e) {
    print(e);
  }
}
