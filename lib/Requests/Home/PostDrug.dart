import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<void> postFavFood({@required int fat, @required String token}) async {
  try {
    final String url = '$apiURL/drug';
    await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'fat': fat,
        }));
  } catch (e) {
    print(e);
  }
}
