import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/main.dart';

Future<void> postFavFood({int fat}) async {
  try {
    final String url = '$apiURL/drug';
    String token = await getToken();
    Response response = await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'fat': fat,
        }));
    log(response.body);
  } catch (e) {
    print(e);
  }
}
