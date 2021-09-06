import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSettings.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:roa_help/Utils/Notifications/LocalNotifyManager.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/generated/l10n.dart';

class Logout extends StatefulWidget {
  const Logout({Key key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
    return AlertDialog(
      title: Text(
        S.of(context).confirmation,
        style: Theme.of(context).textTheme.headline2,
      ),
      content: Text(S.of(context).confirmation_description,
          style: Theme.of(context).textTheme.headline5),
      actionsPadding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      actions: [
        ButtonSettings(
          titleButton: S.of(context).cancel,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ButtonSettings(
          titleButton: S.of(context).log_out,
          onTap: () async {
            await localNotifyManager.cancelNotification(0);
            await localNotifyManager.cancelNotification(1);
            await controller.notificationsController.saveNotifications(
                key: KeysCache.morningNotification, currentPosition: false);
            await controller.notificationsController.saveNotifications(
                key: KeysCache.eveningNotification, currentPosition: false);
            await controller.authController.removeUser();
            Navigator.pushNamed(context, Routes.welcomeNew);
          },
        ),
      ],
    );
  }
}
