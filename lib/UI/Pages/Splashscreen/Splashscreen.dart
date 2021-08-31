import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Controllers/NotificationsController.dart';
import 'package:roa_help/UI/General/General.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isCalled = false;

  Future<void> load(NotificationsController controller) async {
    await Future.wait([
      controller.getSavedNotifications(),
      controller.getSavedDayNorm(),
      Future.delayed(Duration(milliseconds: 1500))
    ]);
    Navigator.push(context, MaterialPageRoute(builder: (context) => General()));
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<GeneralController>(context).notificationsController;
    if (isCalled == false) {
      load(controller);
    }
    isCalled = true;
    return Scaffold(
      backgroundColor: Style.black,
      body: Center(child: IconSvg(IconsSvg.appIcon)),
    );
  }
}
