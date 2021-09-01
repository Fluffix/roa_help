import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';
import 'package:roa_help/Controllers/WaterController.dart';

class GeneralController {
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeyNotifications = GlobalKey<NavigatorState>();
  final navigatorKeyWater = GlobalKey<NavigatorState>();
  final navigatorKeyFeelings = GlobalKey<NavigatorState>();

  // FATS, CALC
  FoodController foodController;

  // NOTIFICATION
  NotificationsController notificationsController;

  // WATER
  WaterController waterController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    notificationsController = NotificationsController(
        navigatorKeyNotifications: navigatorKeyNotifications);
    waterController = WaterController(navigatorKeyWater: navigatorKeyWater);
  }
}
