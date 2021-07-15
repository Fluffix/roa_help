class GetFood {
  List<Items> items;

  GetFood({this.items});

  GetFood.fromJson(Map<String, dynamic> json) {
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
  String name;
  String fat;
  String category;

  Items({this.name, this.fat, this.category});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fat = json['fat'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fat'] = this.fat;
    data['category'] = this.category;
    return data;
  }
}
