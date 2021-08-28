import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<dynamic> getCities() async {
  try {
    final String url = "$apiURL/cities";
    var response = await http.get(url);

    List<dynamic> jsonList = json.decode(response.body);
    log("$jsonList");
    return jsonList;
  } catch (e) {
    print(e);
  }
}
