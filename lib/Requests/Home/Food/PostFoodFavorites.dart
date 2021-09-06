import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<void> postFavFood(
    {@required int id, @required bool add, @required String token}) async {
  try {
    final String url = '$apiURL/food';
    await http.post(Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'add': add,
        }));
  } catch (e) {
    print(e);
  }
}
