import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/main.dart';
import 'package:roa_help/models/ChosenFeelingsModel.dart';

Future<void> sideEffectsPost(List<Map<String, dynamic>> body) async {
  try {
    final String url = '$apiURL/side_effects';
    String token = await getToken();
    await http.post(Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: json.encode(body));
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
  await sideEffectsPost(body);
}
