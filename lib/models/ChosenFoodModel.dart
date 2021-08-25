import 'package:flutter/cupertino.dart';
import 'package:roa_help/Requests/Food/FatsCounterSerialise.dart';

class ChosenFoodModel {
  final Food item;
  final int fatsWasEaten;

  ChosenFoodModel({@required this.item, @required this.fatsWasEaten});
}
