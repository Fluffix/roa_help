import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Pharmacies/PharmaciesSerialise.dart';
import 'package:roa_help/main.dart';
import 'package:http/http.dart' as http;

Future<List<Pharmacy>> getFood({
  @required String city,
  @required String drug,
  @required String token,
}) async {
  try {
    if (drug == '') {
      return [];
    }
    final String url = '$apiURL/food?city=$city&drug=$drug';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $token",
      },
    );
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      PharmaciesSerialise db = PharmaciesSerialise.fromJson(jsonMap);
      return db.pharmacies;
    }
    return null;
  } catch (e) {
    print(e);
    return null;
  }
}
