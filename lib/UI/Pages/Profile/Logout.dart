import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Logout/Logout.dart';
import 'package:roa_help/UI/General/widgets/FilledButton.dart';
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        S.of(context).confirmation,
        style: Theme.of(context).textTheme.headline2,
      ),
      content: Text(S.of(context).confirmation_description,
          style: Theme.of(context).textTheme.headline5),
      buttonPadding: EdgeInsets.zero,
      actions: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: FilledButton(
                nameButton: S.of(context).cancel,
                onTap: () => Navigator.pop(context),
                roundBottomRight: false,
              ),
            ),
            Container(
              width: 1.5,
              color: Theme.of(context).canvasColor,
            ),
            Expanded(
              flex: 2,
              child: FilledButton(
                nameButton: S.of(context).log_out,
                onTap: () async {
                  await localNotifyManager.cancelNotification(0);
                  await localNotifyManager.cancelNotification(1);
                  await controller.notificationsController.saveNotifications(
                      key: KeysCache.morningNotification,
                      currentPosition: false);
                  await controller.notificationsController.saveNotifications(
                      key: KeysCache.eveningNotification,
                      currentPosition: false);
                  await removeToken();
                  await postLogout(token: controller.authController.data.token);
                  Navigator.pushReplacementNamed(context, Routes.welcomeNew);
                },
                roundBottomLeft: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
