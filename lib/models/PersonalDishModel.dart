import 'package:flutter/cupertino.dart';

class PersonalDishModel {
  PersonalDishModel({
    @required this.id,
    @required this.name,
    @required this.fats,
  });

  final int id;
  final String name;
  final int fats;
}
