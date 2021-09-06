import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Profile/Profile.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
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

  Future<int> auth({
    @required BuildContext context,
    @required String code,
    @required GeneralController controller,
  }) async {
    int statusCode = await authRequest(code: code);
    switch (statusCode) {
      case 200:
      case 201:
        StatsSerialise stats =
            await getStats(token: controller.authController.data.token);
        ProfileInfoSerialise profileInfo =
            await getProfile(token: controller.authController.data.token);
        controller.sideEffectsController
            .countSideEffects(quantity: stats.countSideEffects);
        await controller.waterController
            .setDayNorm(waterDayNorm: profileInfo.waterDayNorm);
        await controller.waterController.setWasDrinked(wasDrinked: stats.water);
        await controller.notificationsController.getSavedNotifications();
        return statusCode;
    }
    return null;
  }

  // void authRegistration({
  //   @required BuildContext context,
  //   @required TextEditingController usernameController,
  //   @required TextEditingController passwordController,
  //   @required TextEditingController confirmPasswordController,
  //   @required String chosenCity,
  // }) async {
  //   if (usernameController.text.isEmpty) {
  //     exceptionToast('empty username');
  //   } else if (passwordController.text.length < 8) {
  //     exceptionToast('password unsafe');
  //   } else if (passwordController.text != confirmPasswordController.text) {
  //     exceptionToast('passwords differ');
  //   } else {
  //     int statusCode = await regRequest(
  //       userName: usernameController.text,
  //       password: passwordController.text,
  //       extra: chosenCity != null
  //           ? {
  //               "city": '$chosenCity',
  //               "waterDayNorm": 8,
  //             }
  //           : {"waterDayNorm": 8},
  //     );
  //     switch (statusCode) {
  //       case 200:
  //         StatsSerialise stats = await getStats();
  //         ProfileInfoSerialise profileInfo = await getProfile();
  //         await controller.waterController.setDayNorm(
  //             waterDayNorm: profileInfo.waterDayNorm, startAnimation: true);
  //         await controller.waterController
  //             .setWasDrinked(wasDrinked: stats.water);
  //         await controller.notificationsController.getSavedNotifications();
  //         Navigator.pushNamed(context, '/home');
  //         break;
  //       case 422:
  //         exceptionToast('The username has already been taken');
  //         break;
  //     }
  //   }
  // }

  Future<void> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token');
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
