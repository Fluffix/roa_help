import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounter.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Food/PostFoodFavorites.dart';
import 'package:roa_help/UI/Pages/Home/Home.dart';
import 'package:roa_help/models/FatsCountModel.dart';
import 'package:rxdart/rxdart.dart';

class FoodState {
  final bool loading;
  final List<FoodItem> foods;
  final List<FatsCountInfo> meals;
  final List<FoodItem> favorites;

  FoodState({this.loading, this.foods, this.meals, this.favorites});
}

class FoodController {
  final GlobalKey<NavigatorState> navigatorKeyFoods;
  bool _loading;
  List<FoodItem> _foods;
  List<FatsCountInfo> _meals;
  List<FoodItem> _favorites;

  BehaviorSubject<FoodState> _controllerFoods = BehaviorSubject();
  FoodState get data => _controllerFoods.valueOrNull;
  get streamFoods => _controllerFoods.stream;

  FoodController({@required this.navigatorKeyFoods}) {
    _foods = [];
    _loading = false;
    _meals = [FatsCountInfo.empty(), FatsCountInfo.empty()];
    setState();
  }

  //  Search
  void search({@required String text, String token}) async {
    _foods = [];
    _foods = await getFood(searchText: text, token: token);
    _loading = false;
    setState();
  }

  // Add and Remove Dish, Count Meal Fats
  void addToChosenList({
    @required int index,
    @required FoodItem item,
    @required int fatsWasEaten,
  }) {
    _meals[index]
        .foodWasEaten
        .add(ChosenFoodModel(item: item, fatsWasEaten: fatsWasEaten));
    setState();
  }

  void removeFromChosenList(
      {@required int index, @required FoodItem removingItem}) {
    _meals[index]
        .foodWasEaten
        .removeWhere((element) => element.item.id == removingItem.id);
    setState();
  }

  void updateMealResult(int index) {
    _meals[index].fatsWasEaten = 0;
    _meals[index].foodWasEaten.forEach((element) {
      _meals[index].fatsWasEaten += element.fatsWasEaten;
    });
    if (_meals[index].fatsWasEaten == 0) {
      _meals[index] = FatsCountInfo.empty();
    }
    setState();
  }

  bool isItemInChosen({
    @required int index,
    @required FoodItem currentItem,
  }) {
    bool result = false;
    _meals[index].foodWasEaten.forEach((element) {
      if (element.item.id == currentItem.id) {
        result = true;
      }
    });
    return result;
  }

  void removeElement(
      {@required int index, @required ChosenFoodModel removingItem}) {
    _meals[index].foodWasEaten.remove(removingItem);
    setState();
  }

  void setMealResult({
    @required int index,
    @required FatsCountInfo currentMeal,
  }) {
    _meals[index] = currentMeal;
    setState();
  }

  // Favorites
  void setFavoritesList({@required List<FoodItem> list}) {
    _favorites = list;
    setState();
  }

  void favoritesControll({
    @required int index,
    @required String token,
  }) async {
    _favorites[index].inFavorites = !_favorites[index].inFavorites;
    setState();
    await postFavFood(
      id: _favorites[index].id,
      add: _favorites[index].inFavorites,
      token: token,
    );
  }

  void setState() {
    FoodState state = FoodState(
      loading: _loading,
      foods: _foods,
      meals: _meals,
      favorites: _favorites,
    );
    _controllerFoods.sink.add(state);
  }

  void dispose() {
    _controllerFoods.close();
  }
}
