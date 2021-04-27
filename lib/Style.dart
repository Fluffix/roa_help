import 'package:flutter/material.dart';

final String fontFamilyMedium = "SanFrancisco";

const Color cWhite = Color.fromRGBO(246, 247, 251, 1);
const Color cBlack = Color.fromRGBO(32, 35, 40, 1);
const Color cText = Color.fromRGBO(65, 62, 82, 1);
const Color cIcon = Color.fromRGBO(201, 200, 205, 1);
const Color cSecondary = Color.fromRGBO(136, 134, 145, 1);
const Color cDarkIcon = Color.fromRGBO(242, 175, 208, 1);
const Color cLightIcon = Color.fromRGBO(230, 197, 244, 1);
const Color cDarkArticles = Color.fromRGBO(62, 65, 70, 0.8);
const Color cLightArticles = Color.fromRGBO(230, 197, 244, 0.8);

final kDarkTheme = ThemeData.dark().copyWith(
    dialogBackgroundColor: cDarkArticles,
    primaryColorDark: cWhite,
    accentColor: cText,
    buttonColor: cText,
    backgroundColor: cBlack,
    focusColor: cDarkIcon,
    disabledColor: cSecondary,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 36,
          fontWeight: FontWeight.w500),
      headline2: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 18,
          fontWeight: FontWeight.w700),
      headline3: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w600),
      headline4: TextStyle(
          color: cSecondary,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      headline5: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      subtitle1: TextStyle(
          color: cIcon,
          fontFamily: fontFamilyMedium,
          fontSize: 11,
          fontWeight: FontWeight.w600),
      caption: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 40,
          fontWeight: FontWeight.w700),
    ));

final kLightTheme = ThemeData.light().copyWith(
    dialogBackgroundColor: cLightArticles,
    primaryColorDark: cText,
    accentColor: cText,
    buttonColor: cWhite,
    backgroundColor: cWhite,
    focusColor: cLightIcon,
    disabledColor: cSecondary,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: cBlack,
          fontFamily: fontFamilyMedium,
          fontSize: 36,
          fontWeight: FontWeight.w500),
      headline2: TextStyle(
          color: cBlack,
          fontFamily: fontFamilyMedium,
          fontSize: 18,
          fontWeight: FontWeight.w700),
      headline3: TextStyle(
          color: cBlack,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w600),
      headline4: TextStyle(
          color: cSecondary,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      headline5: TextStyle(
          color: cBlack,
          fontFamily: fontFamilyMedium,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      subtitle1: TextStyle(
          color: cSecondary,
          fontFamily: fontFamilyMedium,
          fontSize: 11,
          fontWeight: FontWeight.w600),
      caption: TextStyle(
          color: cBlack,
          fontFamily: fontFamilyMedium,
          fontSize: 40,
          fontWeight: FontWeight.w700),
    ));
