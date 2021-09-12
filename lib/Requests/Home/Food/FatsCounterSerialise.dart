class GetFood {
  List<FoodItem> items;

  GetFood({this.items});

  GetFood.fromJson(Map<String, dynamic> json) {
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

class FoodItem {
  int id;
  String name;
  double fat;
  bool inFavorites;

  FoodItem({this.id, this.name, this.fat, this.inFavorites});

  FoodItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fat = json['fat'].toDouble();
    inFavorites = json['in_favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fat'] = this.fat;
    data['in_favorites'] = this.inFavorites;
    return data;
  }
}
