import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/SettingsController.dart';
import 'package:roa_help/Controllers/WaterController.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaterControl.dart';

class GeneralController {
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeySettings = GlobalKey<NavigatorState>();
  final navigatorKeyWater = GlobalKey<NavigatorState>();
  final navigatorKeyFeelings = GlobalKey<NavigatorState>();

  // Fats, Calc
  FoodController foodController;

  // Notification
  SettingsController settingsController;

  // Water
  WaterController waterController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    settingsController =
        SettingsController(navigatorKeySettings: navigatorKeySettings);
    waterController = WaterController(navigatorKeyWater: navigatorKeyWater);
  }
}
