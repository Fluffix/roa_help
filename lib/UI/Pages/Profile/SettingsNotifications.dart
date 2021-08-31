import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/General/widgets/SwitchButton.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/General/General.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonNotification.dart';
import 'package:roa_help/Utils/Cache/Keys.dart';
import 'package:roa_help/Utils/Notifications/LocalNotifyManager.dart';
import 'package:roa_help/generated/l10n.dart';

class SettingsNotifications extends StatefulWidget {
  final Function onTap;

  const SettingsNotifications({Key key, this.onTap}) : super(key: key);

  @override
  _SettingsNotificationsState createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  void onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  void onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return General();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<GeneralController>(context).notificationsController;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AdaptiveTheme.of(context).theme !=
                  AdaptiveTheme.of(context).darkTheme
              ? Style.shadowCard
              : null),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  S.of(context).morning,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SwitchButton(
                  isActive: controller.data.morningNotification,
                  activeColor: Theme.of(context).sliderTheme.activeTrackColor,
                  inactiveColor:
                      Theme.of(context).sliderTheme.inactiveTrackColor,
                  activeCircleColor:
                      Theme.of(context).sliderTheme.activeTickMarkColor,
                  inactiveCircleColor:
                      Theme.of(context).sliderTheme.inactiveTickMarkColor,
                  turnOnWithWaitAndCancel:
                      (Function(bool cancelSwitching) callBack) async {
                    DateTime timeNotification;
                    bool cancelIsPressed = false;
                    await DatePicker.showTimePicker(context,
                        showSecondsColumn: false, onConfirm: (confirmTime) {
                      setState(() {
                        timeNotification = confirmTime;
                      });
                    }, onCancel: () {
                      callBack(true);
                      cancelIsPressed = true;
                    },
                        locale: LocaleType.ru,
                        currentTime: DateTime.now(),
                        theme: DatePickerTheme(
                          cancelStyle: Theme.of(context).textTheme.headline2,
                          doneStyle:
                              Theme.of(context).primaryTextTheme.headline3,
                          itemStyle: Theme.of(context).textTheme.headline2,
                          backgroundColor: Theme.of(context).backgroundColor,
                          headerColor: Theme.of(context).backgroundColor,
                        ));
                    if (timeNotification != null) {
                      await localNotifyManager.scheduleNotification(
                          time: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            timeNotification.hour,
                            timeNotification.minute,
                          ),
                          id: 0,
                          title: S.of(context).morning,
                          body: S.of(context).time_take_drug);
                      controller.saveNotifications(
                          key: KeysCache.morningNotification,
                          currentPosition: true);
                    } else if (cancelIsPressed == false) {
                      callBack(true);
                    }
                  },
                  turnOff: () {
                    localNotifyManager.cancelNotification(0);
                    controller.saveNotifications(
                        key: KeysCache.morningNotification,
                        currentPosition: false);
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  S.of(context).evening,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SwitchButton(
                  isActive: controller.data.eveningNotification,
                  activeColor: Theme.of(context).sliderTheme.activeTrackColor,
                  inactiveColor:
                      Theme.of(context).sliderTheme.inactiveTrackColor,
                  activeCircleColor:
                      Theme.of(context).sliderTheme.activeTickMarkColor,
                  inactiveCircleColor:
                      Theme.of(context).sliderTheme.inactiveTickMarkColor,
                  turnOnWithWaitAndCancel:
                      (Function(bool cancelSwitching) callBack) async {
                    DateTime timeNotification;
                    bool cancelIsPressed = false;
                    await DatePicker.showTimePicker(context,
                        showSecondsColumn: false, onConfirm: (confirmTime) {
                      setState(() {
                        timeNotification = confirmTime;
                      });
                    }, onCancel: () {
                      callBack(true);
                      cancelIsPressed = true;
                    },
                        locale: LocaleType.ru,
                        currentTime: DateTime.now(),
                        theme: DatePickerTheme(
                          cancelStyle: Theme.of(context).textTheme.headline2,
                          doneStyle:
                              Theme.of(context).primaryTextTheme.headline3,
                          itemStyle: Theme.of(context).textTheme.headline2,
                          backgroundColor: Theme.of(context).backgroundColor,
                          headerColor: Theme.of(context).backgroundColor,
                        ));
                    if (timeNotification != null) {
                      await localNotifyManager.scheduleNotification(
                          time: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            timeNotification.hour,
                            timeNotification.minute,
                          ),
                          id: 1,
                          title: S.of(context).evening,
                          body: S.of(context).time_take_drug);
                      controller.saveNotifications(
                          key: KeysCache.eveningNotification,
                          currentPosition: true);
                    } else if (cancelIsPressed == false) {
                      callBack(true);
                    }
                  },
                  turnOff: () {
                    localNotifyManager.cancelNotification(1);
                    controller.saveNotifications(
                        key: KeysCache.eveningNotification,
                        currentPosition: false);
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            ButtonNotification(
              titleButton: S.of(context).back,
              onTap: widget.onTap,
              onChance: () {},
            )
          ],
        ),
      ),
    );
  }
}
