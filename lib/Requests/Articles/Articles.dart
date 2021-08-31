import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Articles/ArticlesSerialise.dart';

import 'package:roa_help/main.dart';

Future<List<Article>> getArticles() async {
  try {
    final String url = '$apiURL/get/articles';
    var response = await http.get(url);
    int statusCode = response.statusCode;
    Map<String, dynamic> jsonMap = json.decode(response.body);
    ArticlesSerialise db = ArticlesSerialise.fromJson(jsonMap);
    return db.articles;
  } catch (e) {
    print(e);
  }
}
