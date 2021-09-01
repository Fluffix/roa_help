import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';

class FatsCountInfo {
  int fatsWasEaten;
  List<ChosenFoodModel> foodWasEaten;
  FatsCountInfo({this.fatsWasEaten, this.foodWasEaten});
  FatsCountInfo.empty() {
    fatsWasEaten = null;
    foodWasEaten = [];
  }
}

class FavoritesFood {
  List<FoodItem> favorites;
  FavoritesFood({this.favorites});
  FavoritesFood.empty() {
    favorites = [];
  }
}

class ChosenFoodModel {
  final FoodItem item;
  final int fatsWasEaten;

  ChosenFoodModel({@required this.item, @required this.fatsWasEaten});
}
