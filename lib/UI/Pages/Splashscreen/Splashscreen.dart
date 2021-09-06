import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Profile/Profile.dart';
import 'package:roa_help/Requests/Profile/ProfileSetialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool _isCalled = false;

  Future<void> load(GeneralController controller) async {
    String _token = await getToken();
    List<dynamic> _data;
    if (_token == null) {
      await Future.delayed(Duration(milliseconds: 2000));
      Navigator.pushReplacementNamed(context, Routes.welcomeNew);
    } else {
      _data = await Future.wait([
        getStats(loadedToken: _token),
        getProfile(loadedToken: _token),
        Future.delayed(Duration(milliseconds: 2000))
      ]);
      StatsSerialise stats = _data[0];
      ProfileInfoSerialise profileInfo = _data[1];
      controller.sideEffectsController
          .countSideEffects(quantity: stats.countSideEffects);
      await controller.waterController.setDayNorm(
          waterDayNorm: profileInfo.waterDayNorm, startAnimation: true);
      await controller.waterController.setWasDrinked(wasDrinked: stats.water);
      await controller.notificationsController.getSavedNotifications();
      Navigator.pushReplacementNamed(context, Routes.home);
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: RiveAnimation.asset(
                'assets/animations/splash.riv',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('${S.of(context).app_name}',
                style: Theme.of(context).textTheme.subtitle2)
          ],
        ),
      ),
    );
  }
}
