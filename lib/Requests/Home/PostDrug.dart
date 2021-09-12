import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<void> postDrug({@required String token}) async {
  try {
    final String url = '$apiURL/drug';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
    log("${response.body}");
  } catch (e) {
    print(e);
  }
}
