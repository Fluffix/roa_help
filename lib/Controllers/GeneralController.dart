import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/AuthController.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';
import 'package:roa_help/Controllers/SideEffectsController.dart';
import 'package:roa_help/Controllers/WaterController.dart';

class GeneralController {
  final navigatorKeyAuth = GlobalKey<NavigatorState>();
  final navigatorKeyWater = GlobalKey<NavigatorState>();
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeySideEffects = GlobalKey<NavigatorState>();
  final navigatorKeyNotifications = GlobalKey<NavigatorState>();

  //AUTHENTIFICATION
  AuthController authController;

  // WATER
  WaterController waterController;

  // FATS, CALC
  FoodController foodController;

  //  SIDE EFFECTS
  SideEffectsController sideEffectsController;

  // NOTIFICATION
  NotificationsController notificationsController;

  GeneralController() {
    authController = AuthController(
      navigatorKeyAuthentification: navigatorKeyAuth,
    );
    waterController = WaterController(navigatorKeyWater: navigatorKeyWater);
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    sideEffectsController =
        SideEffectsController(navigatorKeySideEffects: navigatorKeySideEffects);
    notificationsController = NotificationsController(
      navigatorKeyNotifications: navigatorKeyNotifications,
    );
  }
}
