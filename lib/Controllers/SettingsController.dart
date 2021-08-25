import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateSettings {
  StateSettings(
      {@required this.morningNotification,
      @required this.eveningNotification,
      @required this.waterNormDay});

  final bool morningNotification;
  final bool eveningNotification;
  final int waterNormDay;
}

class SettingsController {
  SettingsController({@required this.navigatorKeySettings});

  final GlobalKey<NavigatorState> navigatorKeySettings;
  bool _morningNotification;
  bool _eveningNotification;
  int _waterNormDay;

  BehaviorSubject<StateSettings> _controllerNotifications = BehaviorSubject();
  ValueStream<StateSettings> get stream => _controllerNotifications.stream;
  StateSettings get data => _controllerNotifications.valueOrNull;

  //NOTIFICATIONS
  void saveNotifications(
      {@required String key, @required bool currentPosition}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, currentPosition);

    switch (key) {
      case KeysCache.morningNotification:
        _morningNotification = currentPosition;
        break;
      case KeysCache.eveningNotification:
        _eveningNotification = currentPosition;
        break;
    }

    setState();
  }

  void getSavedNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(KeysCache.morningNotification) != null) {
      _morningNotification = prefs.getBool(KeysCache.morningNotification);
    } else {
      _morningNotification = false;
    }

    if (prefs.getBool(KeysCache.eveningNotification) != null) {
      _eveningNotification = prefs.getBool(KeysCache.eveningNotification);
    } else {
      _eveningNotification = false;
    }

    setState();
  }

  //WATERCONTROLL
  void saveDayNorm({@required String key, @required int waterNormDay}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, waterNormDay);

    _waterNormDay = waterNormDay;

    setState();
  }

  void getSavedDayNorm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt(KeysCache.waterNormDay) != null) {
      _waterNormDay = prefs.getInt(KeysCache.waterNormDay);
    } else {
      _waterNormDay = 8;
    }

    setState();
  }

  //GENERAL
  setState() {
    StateSettings state = StateSettings(
        morningNotification: _morningNotification,
        eveningNotification: _eveningNotification,
        waterNormDay: _waterNormDay);
    _controllerNotifications.sink.add(state);
  }

  dispose() {
    _controllerNotifications.close();
  }
}