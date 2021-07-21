import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'IconData.dart';

// ignore: non_constant_identifier_names
Widget IconSvg(int id,
    {Color color, double width, double height, bool nullColor}) {
  // ignore: unused_element
  String icon(String name, {bool active, bool check}) {
    String path = "assets/images/";
    if (active != null) path = "lib/assets/images/active/";
    if (check != null) path = "lib/assets/images/checkBox/";
    String ex = ".svg";
    return path + name + ex;
  }

  String iconName;

  int count = 38;
  if (id < 0 || id >= count) id = 0;
  switch (id) {
    case 0:
      iconName = icon('home');
      break;
    case 1:
      iconName = icon('articles');
      break;
    case 2:
      iconName = icon('pills');
      break;
    case 3:
      iconName = icon('markets');
      break;
    case 4:
      iconName = icon('person');
      break;
    case 5:
      iconName = icon('articlesDark');
      break;
    case 6:
      iconName = icon('articlesLight');
      break;
    case 7:
      iconName = icon('homeDark');
      break;
    case 8:
      iconName = icon('homeLight');
      break;
    case 9:
      iconName = icon('marketsDark');
      break;
    case 10:
      iconName = icon('marketsLight');
      break;
    case 11:
      iconName = icon('marketsTopDark');
      break;
    case 12:
      iconName = icon('marketsTopLight');
      break;
    case 13:
      iconName = icon('profileDark');
      break;
    case 14:
      iconName = icon('profileLight');
      break;
    case 15:
      iconName = icon('profileTopDark');
      break;
    case 16:
      iconName = icon('profileLightDark');
      break;
    case 17:
      iconName = icon('calendar');
      break;
    case 18:
      iconName = icon('waterDrop');
      break;
    case 19:
      iconName = icon('recipes');
      break;
    case 20:
      iconName = icon('fats');
      break;
    case 21:
      iconName = icon('feeling');
      break;
    case 22:
      iconName = icon('plus');
      break;
    case 23:
      iconName = icon('chooseCity');
      break;
    case 24:
      iconName = icon('chooseDrug');
      break;
    case 25:
      iconName = icon('next');
      break;
    case 26:
      iconName = icon('backgroundDark');
      break;
    case 27:
      iconName = icon('backgroundLight');
      break;
    case 28:
      iconName = icon('add');
      break;
    case 29:
      iconName = icon('done');
      break;
    case 30:
      iconName = icon('remove');
      break;
    case 31:
      iconName = icon('star');
      break;
    case 32:
      iconName = icon('darkMode');
      break;
    case 33:
      iconName = icon('lightMode');
      break;
    case 34:
      iconName = icon('find');
      break;
    case 35:
      iconName = icon('pencil');
      break;
    case 36:
      iconName = icon('addGramms');
      break;
    case 37:
      iconName = icon('cancel');
      break;
  }

  final String assetName = iconName;
  final Widget svg = SvgPicture.asset(assetName,
      height: height, width: width, color: color, semanticsLabel: 'Acme Logo');

  return svg;
}
