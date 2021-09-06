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

  void search({@required String text, String token}) async {
    _foods = [];
    _foods = await getFood(searchText: text, token: token);
    _loading = false;
    setState();
  }

  void setState() {
    FoodState state = FoodState(
      loading: _loading,
      foods: _foods,
    );
    _controllerFoods.sink.add(state);
  }

  void dispose() {
    _controllerFoods.close();
  }
}
