import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<void> postLogout({@required String token}) async {
  try {
    final String url = '$apiURL/logout';
    await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
  } catch (e) {
    print(e);
  }
}
