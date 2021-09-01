import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Cities/CitiesSerialise.dart';
import 'package:roa_help/main.dart';

Future<List<String>> getCities() async {
  try {
    final String url = "$apiURL/cities";
    var response = await http.get(url);

    Map<String, dynamic> jsonMap = json.decode(response.body);

    CitiesSerialise db = CitiesSerialise.fromJson(jsonMap);
    return db.items;
  } catch (e) {
    print(e);
    return null;
  }
}
