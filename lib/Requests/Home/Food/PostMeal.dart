import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:roa_help/Requests/Home/Food/MealSerialise.dart';
import 'package:roa_help/main.dart';
import 'package:roa_help/models/FatsCountModel.dart';

Future<void> postDrug({
  @required String token,
  @required int mealIndex,
  @required FatsCountInfo meal,
}) async {
  try {
    final String url = '$apiURL/meal';

    List<ChosenItem> items = [];
    meal.foodWasEaten.forEach((element) {
      items.add(ChosenItem(
          name: element.item.name,
          foodId: element.item.id,
          fat: element.item.fat,
          amount: element.amount));
    });

    Map<String, dynamic> body = MealSerialise(
            index: mealIndex, fatsWasEaten: meal.fatsWasEaten, items: items)
        .toJson();
    log("${jsonEncode(body)}");
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(body));
    log("${response.body}");
  } catch (e) {
    print(e);
  }
}
