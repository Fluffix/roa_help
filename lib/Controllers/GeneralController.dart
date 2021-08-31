import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';

class GeneralController {
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeyNotifications = GlobalKey<NavigatorState>();

  // Fats, Calc
  FoodController foodController;

  // Notification, WaterControll
  NotificationsController notificationsController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    notificationsController = NotificationsController(
        navigatorKeyNotifications: navigatorKeyNotifications);
  }
}
