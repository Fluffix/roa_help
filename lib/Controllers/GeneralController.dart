import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/AuthController.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';
import 'package:roa_help/Controllers/WaterController.dart';

class GeneralController {
  final navigatorKeyAuth = GlobalKey<NavigatorState>();
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeyNotifications = GlobalKey<NavigatorState>();
  final navigatorKeyWater = GlobalKey<NavigatorState>();

  //AUTHENTIFICATION
  AuthController authController;

  // FATS, CALC
  FoodController foodController;

  // NOTIFICATION
  NotificationsController notificationsController;

  // WATER
  WaterController waterController;

  GeneralController() {
    authController = AuthController(
      navigatorKeyAuthentification: navigatorKeyAuth,
    );
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    notificationsController = NotificationsController(
      navigatorKeyNotifications: navigatorKeyNotifications,
    );
    waterController = WaterController(navigatorKeyWater: navigatorKeyWater);
  }
}
