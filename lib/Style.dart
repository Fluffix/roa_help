import 'package:flutter/material.dart';

final String fontFamilyMedium = "SanFrancisco";

const Color cWhite = Color.fromRGBO(246, 247, 251, 1);
const Color cBlack = Color.fromRGBO(32, 35, 40, 1);
const Color cText = Color.fromRGBO(65, 62, 82, 1);
const Color cIcon = Color.fromRGBO(201, 200, 205, 1);
const Color cSecondary = Color.fromRGBO(136, 134, 145, 1);
const Color cDarkIcon = Color.fromRGBO(242, 175, 208, 1);
const Color cLightIcon = Color.fromRGBO(231, 199, 246, 1);
const Color cLightCard = Color.fromRGBO(255, 255, 255, 0.8);
const Color cDarkCard = Color.fromRGBO(62, 65, 70, 0.8);
const Color cBlue = Color.fromRGBO(63, 162, 243, 1);
const Color cDoneButton = Color.fromRGBO(75, 171, 201, 1);
const Color cLightAppBar = Color.fromRGBO(245, 225, 253, 1);
const Color cDarkAppBar = Color.fromRGBO(255, 202, 227, 1);
const Color cShadow = Color.fromRGBO(201, 200, 205, 0.2);
const Color cActiveColor = Color.fromRGBO(230, 197, 244, 0.5);
const Color cFavoritesLightColor = Color.fromRGBO(182, 137, 176, 0.7);

const Color cInactiveColorDark = Color.fromRGBO(136, 134, 145, 0.5);
const Color cInactiveColorLight = Color.fromRGBO(201, 200, 205, 0.5);
const Color cInactiveColorMark = Color.fromRGBO(196, 196, 196, 0.5);

const List<BoxShadow> shadow = [
  BoxShadow(offset: Offset(0, 10), blurRadius: 10, color: cShadow)
];

final kDarkTheme = ThemeData.dark().copyWith(
    sliderTheme: SliderThemeData(
        activeTrackColor: cActiveColor,
        inactiveTrackColor: cInactiveColorDark,
        activeTickMarkColor: cWhite,
        inactiveTickMarkColor: cInactiveColorMark),
    appBarTheme: AppBarTheme(color: cDarkAppBar),
    shadowColor: Colors.transparent,
    dialogBackgroundColor: cInactiveColorDark,
    cardColor: cDarkCard,
    buttonColor: cText,
    backgroundColor: cBlack,
    focusColor: cDarkIcon,
    disabledColor: cSecondary,
    dividerColor: cActiveColor,
    // Home Text Theme
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
          color: cWhite,
          fontFamily: fontFamilyMedium,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      headline2: TextStyle(
          color: cSecondary,
          fontFamily: fontFamilyMedium,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          color: cBlue,
          fontFamily: fontFamilyMedium,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
    // Main Text Theme
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
        headline6: TextStyle(
            color: cWhite,
            fontFamily: fontFamilyMedium,
            fontSize: 12,
            fontWeight: FontWeight.w600),
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
        bodyText1: TextStyle(
            color: cText,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        button: TextStyle(
            color: cWhite,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500)));

final kLightTheme = ThemeData.light().copyWith(
    sliderTheme: SliderThemeData(
        activeTrackColor: cActiveColor,
        inactiveTrackColor: cInactiveColorLight,
        activeTickMarkColor: cWhite,
        inactiveTickMarkColor: cInactiveColorMark),
    appBarTheme: AppBarTheme(color: cLightAppBar),
    shadowColor: cIcon,
    dialogBackgroundColor: cWhite,
    cardColor: cLightCard,
    buttonColor: cWhite,
    backgroundColor: cWhite,
    focusColor: cLightIcon,
    disabledColor: cSecondary,
    dividerColor: cFavoritesLightColor,

    // Home Text Theme
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
          color: cText,
          fontFamily: fontFamilyMedium,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      headline2: TextStyle(
          color: cSecondary,
          fontFamily: fontFamilyMedium,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          color: cDoneButton,
          fontFamily: fontFamilyMedium,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
    // Main Text Theme
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
        headline6: TextStyle(
            color: cSecondary,
            fontFamily: fontFamilyMedium,
            fontSize: 12,
            fontWeight: FontWeight.w600),
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
        bodyText1: TextStyle(
            color: cText,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        button: TextStyle(
            color: cBlack,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500)));
