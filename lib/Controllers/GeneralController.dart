import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';

class GeneralController {
  final navigatorKeyFoods = GlobalKey<NavigatorState>();

  // Fats Calc
  FoodController foodController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
  }
}
