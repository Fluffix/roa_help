import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';
import 'package:roa_help/models/ChosenFeelingsModel.dart';

Future<void> sideEffectsPost({
  @required List<Map<String, dynamic>> body,
  @required String token,
}) async {
  try {
    final String url = '$apiURL/side_effects';
    await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: json.encode(body));
  } catch (e) {
    print(e);
  }
}

Future<void> sendSideEffectsRequest({
  @required List<ChosenFeeling> items,
  @required String token,
}) async {
  List<Map<String, dynamic>> body = [];
  items.forEach((e) {
    body.add({
      'id': e.id,
      'is_added': e.isAdded,
    });
  });
  await sideEffectsPost(body: body, token: token);
}
