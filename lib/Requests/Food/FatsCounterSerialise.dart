// class Food {
//   List<Items> items;

//   Food({this.items});

//   Food.fromJson(List<dynamic> json) {
//     if (json['foods'] != null) {
//       items = [];
//       json['foods'].forEach((v) {
//         items.add(new Items.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.items != null) {
//       data['foods'] = this.items.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Items {
//   int id;
//   String name;
//   int fat;
//   bool inFavorites;

//   Items({this.name, this.fat, this.id, this.inFavorites});

//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     fat = json['fat'];
//     inFavorites = json['inFavorites'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['fat'] = this.fat;
//     data['inFavorites'] = this.inFavorites;
//     return data;
//   }
// }
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
