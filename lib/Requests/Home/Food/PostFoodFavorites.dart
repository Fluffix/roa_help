import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/main.dart';

Future<void> postFavFood({int id, bool add}) async {
  try {
    final String url = '$apiURL/food';
    String token = await getToken();
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
