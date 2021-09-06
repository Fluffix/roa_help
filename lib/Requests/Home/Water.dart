import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<void> waterRequest({
  @required double wasDrinked,
  @required String token,
}) async {
  try {
    final String url = '$apiURL/water';
    await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'water': wasDrinked,
        }));
  } catch (e) {
    print(e);
  }
}
