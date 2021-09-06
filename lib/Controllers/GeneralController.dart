import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';
import 'package:roa_help/Controllers/SideEffectsController.dart';
import 'package:roa_help/Controllers/WaterController.dart';

class GeneralController {
  final navigatorKeyNotifications = GlobalKey<NavigatorState>();
  final navigatorKeyWater = GlobalKey<NavigatorState>();
  final navigatorKeyFoods = GlobalKey<NavigatorState>();
  final navigatorKeyFeelings = GlobalKey<NavigatorState>();
  final navigatorKeySideEffects = GlobalKey<NavigatorState>();

  // WATER
  WaterController waterController;

  // FATS, CALC
  FoodController foodController;

  //  SIDE EFFECTS
  SideEffectsController sideEffectsController;

  // NOTIFICATION
  NotificationsController notificationsController;

  GeneralController() {
    foodController = FoodController(navigatorKeyFoods: navigatorKeyFoods);
    notificationsController = NotificationsController(
        navigatorKeyNotifications: navigatorKeyNotifications);
    waterController = WaterController(navigatorKeyWater: navigatorKeyWater);
    sideEffectsController =
        SideEffectsController(navigatorKeySideEffects: navigatorKeySideEffects);
  }
}
