import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';

class StatsSerialise {
  int water;
  String date;
  int countSideEffects;
  List<CategoryItem> sideEffects;

  StatsSerialise({
    this.water,
    this.date,
    this.sideEffects,
  });

  StatsSerialise.fromJson(Map<String, dynamic> json) {
    water = json['water'];
    date = json['date'];
    countSideEffects = json['side_effects_count'];
    if (json['side_effects'] != null) {
      sideEffects = [];
      json['side_effects'].forEach((v) {
        sideEffects.add(CategoryItem.fromJson(v));
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
