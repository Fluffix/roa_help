class GetFood {
  List<Items> items;

  GetFood({this.items});

  GetFood.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      items = [];
      json['foods'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['foods'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int id;
  String name;
  int fat;
  bool inFavorites;

  Items({this.name, this.fat, this.id, this.inFavorites});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fat = json['fat'];
    inFavorites = json['inFavorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fat'] = this.fat;
    data['inFavorites'] = this.inFavorites;
    return data;
  }
}
