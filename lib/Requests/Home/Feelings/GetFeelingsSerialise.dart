class SideEffectsCategoryiesList {
  List<CategoryItem> items;

  SideEffectsCategoryiesList({this.items});

  SideEffectsCategoryiesList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(CategoryItem.fromJson(v));
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

class CategoryItem {
  int id;
  String name;
  String color;
  List<SideEffectItem> items;

  CategoryItem({this.id, this.name, this.color, this.items});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['category'];
    color = json['color'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(SideEffectItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.name;
    data['color'] = this.color;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SideEffectItem {
  int id;
  String description;
  int categoryId;
  bool isAdded;

  SideEffectItem({this.id, this.description, this.categoryId, this.isAdded});

  SideEffectItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    categoryId = json['category_id'];
    isAdded = json['is_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['is_added'] = this.isAdded;
    return data;
  }
}
