import 'package:flutter/cupertino.dart';

class FeelingsCategoryModel {
  final int categoryId;
  final String categoryName;
  final Color categoryColor;
  final List<FeelingItem> elements;

  FeelingsCategoryModel({
    @required this.categoryId,
    @required this.categoryName,
    @required this.categoryColor,
    @required this.elements,
  });
}

class FeelingItem {
  final String name;
  bool isChosen;

  FeelingItem({
    @required this.name,
    this.isChosen,
  });
}
