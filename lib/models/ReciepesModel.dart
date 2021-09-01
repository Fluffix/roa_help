import 'package:flutter/cupertino.dart';

class ReciepesModel {
  final int id;
  final String name;
  final String time;
  final String ccal;
  final int protein;
  final int fat;
  final int carbo;
  final List<String> ingredients;
  final String description;
  final String thumbnail;

  ReciepesModel(
      {@required this.id,
      @required this.name,
      @required this.time,
      @required this.ccal,
      @required this.protein,
      @required this.fat,
      @required this.carbo,
      @required this.ingredients,
      @required this.description,
      @required this.thumbnail});
}
