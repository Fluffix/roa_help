import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounter.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:rxdart/rxdart.dart';

class FoodState {
  final bool loading;
  final List<FoodItem> foods;

  FoodState({this.loading, this.foods});
}

class FoodController {
  final GlobalKey<NavigatorState> navigatorKeyFoods;
  bool _loading;
  List<FoodItem> _foods;

  BehaviorSubject<FoodState> _controllerFoods = BehaviorSubject();
  get streamFoods => _controllerFoods.stream;

  FoodController({@required this.navigatorKeyFoods}) {
    _foods = [];
    _loading = false;
    setState();
  }

  search(String text) async {
    _foods = [];
    _foods = await getFood(text);
    _loading = false;
    setState();
  }

  setState() {
    FoodState state = FoodState(
      loading: _loading,
      foods: _foods,
    );
    _controllerFoods.sink.add(state);
  }

  dispose() {
    _controllerFoods.close();
  }
}
