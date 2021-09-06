import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Profile/Profile.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateAuth {
  final String token;

  StateAuth({this.token});
}

class AuthController {
  final GlobalKey<NavigatorState> navigatorKeyAuthentification;
  AuthController({@required this.navigatorKeyAuthentification});

  BehaviorSubject<StateAuth> _controllerAuth = BehaviorSubject();

  String _token;

  ValueStream<StateAuth> get stream => _controllerAuth.stream;
  StateAuth get data => _controllerAuth.valueOrNull;

  void authLogin({
    @required BuildContext context,
    @required String userName,
    @required String password,
    @required GeneralController controller,
  }) async {
    var result = await authRequest(userName: userName, password: password);
    switch (result['statusCode']) {
      case 201:
        _saveUser(
            userName: userName, password: password, token: result['token']);
        StatsSerialise stats = await getStats(token: result['token']);
        ProfileInfoSerialise profileInfo =
            await getProfile(token: result['token']);
        await controller.waterController
            .setDayNorm(waterDayNorm: profileInfo.waterDayNorm);
        await controller.waterController.setWasDrinked(wasDrinked: stats.water);
        await controller.notificationsController.getSavedNotifications();
        Navigator.pushNamed(context, Routes.home);
        break;
      case 403:
        exceptionToast('Username or password not correct');
        break;
    }
  }

  void authRegistration({
    @required BuildContext context,
    @required String userName,
    @required String password,
    @required String confirmPassword,
    @required String chosenCity,
    @required GeneralController controller,
  }) async {
    if (userName.isEmpty) {
      exceptionToast('empty username');
    } else if (password.length < 8) {
      exceptionToast('password unsafe');
    } else if (password != confirmPassword) {
      exceptionToast('passwords differ');
    } else {
      var result = await regRequest(
        userName: userName,
        password: password,
        extra: chosenCity != null
            ? {
                "city": '$chosenCity',
                "waterDayNorm": 8,
              }
            : {"waterDayNorm": 8},
      );
      switch (result['statusCode']) {
        case 200:
          _saveUser(
              userName: userName, password: password, token: result['token']);
          StatsSerialise stats = await getStats(token: result['token']);
          ProfileInfoSerialise profileInfo =
              await getProfile(token: result['token']);
          await controller.waterController
              .setDayNorm(waterDayNorm: profileInfo.waterDayNorm);
          await controller.waterController
              .setWasDrinked(wasDrinked: stats.water);
          await controller.notificationsController.getSavedNotifications();
          Navigator.pushNamed(context, Routes.home);
          break;
        case 422:
          exceptionToast('The username has already been taken');
          break;
      }
    }
  }

  Future<void> _saveUser({
    @required String userName,
    @required String password,
    @required String token,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KeysCache.userName, userName);
    prefs.setString(KeysCache.password, password);
    prefs.setString(KeysCache.token, token);

    _token = token;

    setState();
  }

  Future<void> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _token = prefs.getString(KeysCache.token);

    setState();
  }

  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(KeysCache.userName);
    prefs.remove(KeysCache.password);
    prefs.remove(KeysCache.token);

    _token = null;

    setState();
  }

  Future<bool> exceptionToast(String toastText) {
    return Fluttertoast.showToast(
        msg: "$toastText",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.red,
        backgroundColor: Colors.green,
        fontSize: 16.0);
  }

  //GENERAL
  void setState() {
    StateAuth state = StateAuth(
      token: _token,
    );
    _controllerAuth.sink.add(state);
  }

  void dispose() {
    _controllerAuth.close();
  }
}
