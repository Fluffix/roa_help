import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roa_help/main.dart';

Future<dynamic> getCities() async {
  try {
    final String url = "$apiURL/cities";
    var response = await http.get(url);

    Map<String, dynamic> jsonMap = json.decode(response.body);

    GetCities db = GetCities.fromJson(jsonMap);
    return db.items;
  } catch (e) {
    print(e);
  }
}

class GetCities {
  List<String> items;

  GetCities({this.items});

  GetCities.fromJson(Map<String, dynamic> json) {
    items = json['items'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    return data;
  }
}
