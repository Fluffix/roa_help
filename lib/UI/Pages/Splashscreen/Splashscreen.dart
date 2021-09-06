import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Profile/Profile.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool _isCalled = false;

  Future<void> load(GeneralController controller) async {
    await controller.authController.getSavedUser();
    List<dynamic> _data;
    if (controller.authController.data.token == null) {
      await Future.delayed(Duration(milliseconds: 1500));
      Navigator.pushNamed(context, Routes.welcomeNew);
    } else {
      _data = await Future.wait([
        getStats(token: controller.authController.data.token),
        getProfile(token: controller.authController.data.token),
        Future.delayed(Duration(milliseconds: 1500))
      ]);
      StatsSerialise stats = _data[0];
      ProfileInfoSerialise profileInfo = _data[1];
      await controller.waterController
          .setDayNorm(waterDayNorm: profileInfo.waterDayNorm);
      await controller.waterController.setWasDrinked(wasDrinked: stats.water);
      await controller.notificationsController.getSavedNotifications();
      Navigator.pushNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
    if (_isCalled == false) {
      load(controller);
    }
    _isCalled = true;
    return Scaffold(
      backgroundColor: Style.black,
      body: Center(child: IconSvg(IconsSvg.appIcon)),
    );
  }
}
