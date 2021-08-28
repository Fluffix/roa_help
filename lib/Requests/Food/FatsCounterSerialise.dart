class FoodList {
  List<Food> foods;
  FoodList({this.foods});

  factory FoodList.fromJson(List<dynamic> json) {
    return FoodList(
        foods: json
            .map((element) => Food.fromJson(element))
            .toList()
            .cast<Food>());
  }
}

class Food {
  int id;
  String name;
  double fat;
  bool inFavorites;

  Food({this.id, this.name, this.fat, bool inFavorites});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'] == null
          ? 'is null'
          : json['id'] == ''
              ? 'Empty'
              : json['id'],
      name: json['name'] == null
          ? 'is null'
          : json['name'] == ''
              ? 'Empty'
              : json['name'],
      fat: json['fat'] == null
          ? 'is null'
          : json['fat'] == ''
              ? 'Empty'
              : json['fat'],
      inFavorites: true,
    );
  }
}
