import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Food/FatsCounter.dart';
import 'package:roa_help/Requests/Food/FatsCounterSerialise.dart';
import 'package:rxdart/rxdart.dart';

class FoodState {
  final bool loading;
  final FoodList db;

  FoodState({this.loading, this.db});
}

class FoodController {
  final GlobalKey<NavigatorState> navigatorKeyFoods;
  bool _loading;
  FoodList _db;

  BehaviorSubject<FoodState> _controllerFoods = BehaviorSubject();
  get streamFoods => _controllerFoods.stream;

  FoodController({@required this.navigatorKeyFoods}) {
    _db = FoodList();
    _loading = false;
    setState();
  }

  search(String text) async {
    _db = FoodList();
    _db = await getFood(text);
    _loading = false;
    setState();
  }

  setState() {
    FoodState state = FoodState(
      loading: _loading,
      db: _db,
    );
    _controllerFoods.sink.add(state);
  }

  dispose() {
    _controllerFoods.close();
  }
}
