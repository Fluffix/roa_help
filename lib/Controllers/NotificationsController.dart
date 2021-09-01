import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateNotifications {
  StateNotifications({
    @required this.morningNotification,
    @required this.eveningNotification,
  });

  final bool morningNotification;
  final bool eveningNotification;
}

class NotificationsController {
  final GlobalKey<NavigatorState> navigatorKeyNotifications;

  NotificationsController({@required this.navigatorKeyNotifications});

  bool _morningNotification;
  bool _eveningNotification;

  BehaviorSubject<StateNotifications> _controllerNotifications =
      BehaviorSubject();

  ValueStream<StateNotifications> get stream => _controllerNotifications.stream;
  StateNotifications get data => _controllerNotifications.valueOrNull;

  //NOTIFICATIONS
  Future<void> saveNotifications(
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

  //GENERAL
  setState() {
    StateNotifications state = StateNotifications(
      morningNotification: _morningNotification,
      eveningNotification: _eveningNotification,
    );
    _controllerNotifications.sink.add(state);
  }

  dispose() {
    _controllerNotifications.close();
  }
}
