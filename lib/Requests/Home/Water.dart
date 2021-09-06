import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/main.dart';

Future<void> waterRequest({double wasDrinked}) async {
  try {
    final String url = '$apiURL/water';
    String token = await getToken();
    await http.post(Uri.parse(url),
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
