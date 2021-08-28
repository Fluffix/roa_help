import 'package:flutter/cupertino.dart';

class SideEffectsCategoryiesList {
  List<CategoryItem> items;
  SideEffectsCategoryiesList({this.items});

  factory SideEffectsCategoryiesList.fromJson(List<dynamic> json) {
    return SideEffectsCategoryiesList(
        items: json
            .map((e) => CategoryItem.fromJson(e))
            .toList()
            .cast<CategoryItem>());
  }
}

class CategoryItem {
  int id;
  String name;
  String color;
  List<Item> items;

  CategoryItem({this.id, this.name, this.color, this.items});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['category'];
    color = json['color'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
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

class Item {
  int id;
  String description;
  int categoryId;
  bool isAdded;

  Item({this.id, this.description, this.categoryId});

  Item.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
