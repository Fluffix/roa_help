import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';

class FavoriteFoodItems {
  List<FoodItem> items;

  FavoriteFoodItems({this.items});

  FavoriteFoodItems.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new FoodItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}