import 'package:flutter/material.dart';

class Style {
  static const String fontFamilyMedium = "SanFrancisco";

  static const Color white = Color.fromRGBO(246, 247, 251, 1);
  static const Color black = Color.fromRGBO(32, 35, 40, 1);
  static const Color text = Color.fromRGBO(65, 62, 82, 1);
  static const Color icon = Color.fromRGBO(201, 200, 205, 1);
  static const Color secondary = Color.fromRGBO(136, 134, 145, 1);
  static const Color darkIcon = Color.fromRGBO(242, 175, 208, 1);
  static const Color lightIcon = Color.fromRGBO(231, 199, 246, 1);
  static const Color lightCard = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color darkCard = Color.fromRGBO(62, 65, 70, 0.8);
  static const Color darkAppBar = Color.fromRGBO(255, 202, 227, 1);
  static const Color blue = Color.fromRGBO(63, 162, 243, 1);
  static const Color doneButton = Color.fromRGBO(75, 171, 201, 1);
  static const Color lightAppBar = Color.fromRGBO(245, 225, 253, 1);
  static const Color shadow = Color.fromRGBO(201, 200, 205, 0.2);
  static const Color activeColor = Color.fromRGBO(230, 197, 244, 0.5);
  static const Color favoritesLightColor = Color.fromRGBO(182, 137, 176, 0.7);
  static const Color inactiveColorDark = Color.fromRGBO(136, 134, 145, 0.5);
  static const Color inactiveColorLight = Color.fromRGBO(201, 200, 205, 0.5);
  static const Color inactiveColorMark = Color.fromRGBO(196, 196, 196, 0.5);

  static const List<BoxShadow> shadowCard = [
    BoxShadow(offset: Offset(0, 10), blurRadius: 10, color: shadow)
  ];

  static final darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      sliderTheme: SliderThemeData(
          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColorDark,
          activeTickMarkColor: white,
          inactiveTickMarkColor: inactiveColorMark),
      appBarTheme: AppBarTheme(color: darkAppBar),
      shadowColor: Colors.transparent,
      dialogBackgroundColor: inactiveColorDark,
      cardColor: darkCard,
      buttonColor: text,
      backgroundColor: black,
      focusColor: darkIcon,
      disabledColor: secondary,
      dividerColor: activeColor,
      selectedRowColor: white,
      // Home Text Theme
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            color: white,
            fontFamily: fontFamilyMedium,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: secondary,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        headline3: TextStyle(
            color: blue,
            fontFamily: fontFamilyMedium,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: white,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            color: secondary,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      // Main Text Theme
      textTheme: TextTheme(
          headline1: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 36,
              fontWeight: FontWeight.w500),
          headline2: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          headline4: TextStyle(
              color: secondary,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 12,
              fontWeight: FontWeight.w600),
          subtitle1: TextStyle(
              color: icon,
              fontFamily: fontFamilyMedium,
              fontSize: 11,
              fontWeight: FontWeight.w600),
          caption: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 40,
              fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
              color: text,
              fontFamily: fontFamilyMedium,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          button: TextStyle(
              color: white,
              fontFamily: fontFamilyMedium,
              fontSize: 16,
              fontWeight: FontWeight.w500)));

  static final lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      sliderTheme: SliderThemeData(
          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColorLight,
          activeTickMarkColor: white,
          inactiveTickMarkColor: inactiveColorMark),
      appBarTheme: AppBarTheme(color: lightAppBar),
      shadowColor: icon,
      dialogBackgroundColor: white,
      cardColor: lightCard,
      buttonColor: white,
      backgroundColor: white,
      focusColor: lightIcon,
      disabledColor: secondary,
      dividerColor: favoritesLightColor,
      selectedRowColor: text,

      // Home Text Theme
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            color: text,
            fontFamily: fontFamilyMedium,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: secondary,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        headline3: TextStyle(
            color: doneButton,
            fontFamily: fontFamilyMedium,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: text,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            color: secondary,
            fontFamily: fontFamilyMedium,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      // Main Text Theme
      textTheme: TextTheme(
          headline1: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 36,
              fontWeight: FontWeight.w500),
          headline2: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          headline4: TextStyle(
              color: secondary,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              color: secondary,
              fontFamily: fontFamilyMedium,
              fontSize: 12,
              fontWeight: FontWeight.w600),
          subtitle1: TextStyle(
              color: secondary,
              fontFamily: fontFamilyMedium,
              fontSize: 11,
              fontWeight: FontWeight.w600),
          caption: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 40,
              fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
              color: text,
              fontFamily: fontFamilyMedium,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          button: TextStyle(
              color: black,
              fontFamily: fontFamilyMedium,
              fontSize: 16,
              fontWeight: FontWeight.w500)));
}
