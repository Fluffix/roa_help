import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'IconData.dart';

// ignore: non_constant_identifier_names
Widget IconSvg(int id,
    {Color color, double width, double height, bool nullColor}) {
  // ignore: unused_element
  String icon(String name, {bool active, bool check}) {
    String path = "assets/icons/";
    if (active != null) path = "lib/assets/icons/active/";
    if (check != null) path = "lib/assets/icons/checkBox/";
    String ex = ".svg";
    return path + name + ex;
  }

  String iconName;

  int count = 5;
  if (id < 0 || id >= count) id = 0;

  switch (id) {
  }

  final String assetName = iconName;
  final Widget svg = SvgPicture.asset(assetName,
      height: height, width: width, color: color, semanticsLabel: 'Acme Logo');

  return svg;
}
