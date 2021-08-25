import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/SettingsController.dart';

class GeneralController {
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeySettings = GlobalKey<NavigatorState>();

  // Fats, Calc
  FoodController foodController;

  // Notification, WaterControll
  SettingsController settingsController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    settingsController =
        SettingsController(navigatorKeySettings: navigatorKeySettings);
  }
}
