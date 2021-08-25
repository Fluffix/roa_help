import 'package:flutter/cupertino.dart';

class AriclesItem {
  final int icon;
  final String title;
  final String body;
  final Function onTap;

  AriclesItem(
      {@required this.icon,
      @required this.title,
      @required this.body,
      @required this.onTap});
}
