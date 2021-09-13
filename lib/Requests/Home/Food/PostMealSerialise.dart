class MealSerialise {
  int index;
  int fatsWasEaten;
  List<ChosenItem> items;

  MealSerialise({this.index, this.fatsWasEaten, this.items});

  MealSerialise.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    fatsWasEaten = json['fats_was_eaten'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new ChosenItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['fats_was_eaten'] = this.fatsWasEaten;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChosenItem {
  String name;
  int foodId;
  double fat;
  int amount;

  ChosenItem({this.name, this.foodId, this.fat, this.amount});

  ChosenItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    foodId = json['food_id'];
    fat = json['fat'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['food_id'] = this.foodId;
    data['fat'] = this.fat;
    data['amount'] = this.amount;
    return data;
  }
}
