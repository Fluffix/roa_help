import 'dart:convert';

import 'package:roa_help/Requests/Home/GetFeelingsSerialise.dart';

class StatsSerialise {
  int water;
  String date;
  List<CategoryItem> sideEffects;

  StatsSerialise({
    this.water,
    this.date,
    this.sideEffects,
  });

  StatsSerialise.fromJson(Map<String, dynamic> json) {
    water = json['water'];
    date = json['date'];
    if (json['side_effects'] != null) {
      sideEffects = [];
      json['side_effects'].forEach((v) {
        sideEffects.add(new CategoryItem.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['water'] = this.water;
  //   data['date'] = this.date;
  //   if (this.sideEffects != null){
  //   data['side_effects'] = this.sideEffects.map((v) => v.toJson());
  //   }

  // }
}
