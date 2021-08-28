import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/models/ChosenFeelingsModel.dart';

import '../../main.dart';

Future<void> sideEffectsPost(List<Map<String, dynamic>> body) async {
  try {
    final String url = '$apiURL/side_effects';
    String token = await getToken();
    Response response = await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: json.encode(body));

    log(response.body);
    switch (response.statusCode) {
      case 200:
        print(response.body);
    }
    print(response.body);
  } catch (e) {
    print(e);
  }
}

Future<void> sendSideEffectsRequest(List<ChosenFeeling> items) async {
  List<Map<String, dynamic>> body = [];
  items.forEach((e) {
    body.add({
      'id': e.id,
      'is_added': e.isAdded,
    });
  });
  log('$body');
  await sideEffectsPost(body);
}
