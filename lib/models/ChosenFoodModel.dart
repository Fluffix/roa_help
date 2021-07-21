import 'package:flutter/cupertino.dart';
import 'package:roa_help/Requests/Food/FoodRequestSerialise.dart';

class ChosenFoodModel {
  final Items item;
  final int fatsWasEaten;

  ChosenFoodModel({@required this.item, @required this.fatsWasEaten});
}
