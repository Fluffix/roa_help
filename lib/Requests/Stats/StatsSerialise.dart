import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';

class StatsSerialise {
  int water;
  String date;
  int countSideEffects;
  List<CategoryItem> sideEffects;
  Drugs drugs;

  StatsSerialise({
    this.water,
    this.date,
    this.sideEffects,
    this.drugs,
  });

  StatsSerialise.fromJson(Map<String, dynamic> json) {
    water = json['water'];
    date = json['date'];
    drugs = json['drugs'] != null ? new Drugs.fromJson(json['drugs']) : null;
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
  //   if (this.sideEffects != null) {
  //     data['side_effects'] = this.sideEffects.map((v) => v.toJson());
  //   }
  // }
}

class Drugs {
  Drugs({this.first, this.second});
  Take first;
  Take second;

  Drugs.fromJson(Map<String, dynamic> json) {
    first = json['1'] != null ? new Take.fromJson(json['1']) : null;
    second = json['2'] != null ? new Take.fromJson(json['2']) : null;
  }
}

class Take {
  Take({this.date, this.fat});
  String date;
  int fat;

  Take.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    fat = json['fat'];
  }
}
