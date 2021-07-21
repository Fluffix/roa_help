import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Food/FoodRequestSerialise.dart';
import 'package:rxdart/rxdart.dart';

class FoodState {
  final bool loading;
  final List<Items> foods;

  FoodState({this.loading, this.foods});
}

class FoodController {
  final GlobalKey<NavigatorState> navigatorKeyFoods;
  bool _loading;
  List<Items> _foods;

  BehaviorSubject<FoodState> _controllerFoods = BehaviorSubject();
  get streamFoods => _controllerFoods.stream;

  FoodController({@required this.navigatorKeyFoods}) {
    _foods = [];
    _loading = false;
    setState();
  }

  search(String text) async {
    _foods = [
      Items(id: 1, name: 'Яйцо', fat: 100, inFavorites: false),
      Items(id: 2, name: 'Гречневая крупа', fat: 200, inFavorites: true),
    ];
    // _foods = await getFood(text);
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
