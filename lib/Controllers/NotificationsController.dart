import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateNotifications {
  StateNotifications(
      {@required this.morningNotification,
      @required this.eveningNotification,
      @required this.waterNormDay});

  final bool morningNotification;
  final bool eveningNotification;
  final int waterNormDay;
}

class NotificationsController {
  NotificationsController({@required this.navigatorKeyNotifications});

  final GlobalKey<NavigatorState> navigatorKeyNotifications;
  bool _morningNotification;
  bool _eveningNotification;
  int _waterNormDay;

  BehaviorSubject<StateNotifications> _controllerNotifications =
      BehaviorSubject();
  ValueStream<StateNotifications> get stream => _controllerNotifications.stream;
  StateNotifications get data => _controllerNotifications.valueOrNull;

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

  Future<void> getSavedNotifications() async {
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

  Future<void> getSavedDayNorm() async {
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
    StateNotifications state = StateNotifications(
        morningNotification: _morningNotification,
        eveningNotification: _eveningNotification,
        waterNormDay: _waterNormDay);
    _controllerNotifications.sink.add(state);
  }

  dispose() {
    _controllerNotifications.close();
  }
}
