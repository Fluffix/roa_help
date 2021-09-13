class MealSerialise {
  List<Items> items;

  MealSerialise({this.items});

  MealSerialise.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
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

class Items {
  int index;
  int foodId;
  int amount;
  double fat;

  Items({this.index, this.foodId, this.amount, this.fat});

  Items.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    foodId = json['food_id'];
    amount = json['amount'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['food_id'] = this.foodId;
    data['amount'] = this.amount;
    data['fat'] = this.fat;
    return data;
  }
}
