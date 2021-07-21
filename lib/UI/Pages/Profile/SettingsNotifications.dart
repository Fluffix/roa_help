import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/General.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSave.dart';
import 'package:roa_help/UI/widgets/SwitchButton.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/LocalNotifyManager.dart';

class SettingsNotifications extends StatefulWidget {
  final Function onTap;

  const SettingsNotifications({Key key, this.onTap}) : super(key: key);

  @override
  _SettingsNotificationsState createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  DateTime timeNotification;

  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return General();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AdaptiveTheme.of(context).theme !=
                        AdaptiveTheme.of(context).darkTheme
                    ? shadow
                    : null),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).morning,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SwitchButton(
                            activeColor:
                                Theme.of(context).sliderTheme.activeTrackColor,
                            inactiveColor: Theme.of(context)
                                .sliderTheme
                                .inactiveTrackColor,
                            activeCircleColor: Theme.of(context)
                                .sliderTheme
                                .activeTickMarkColor,
                            inactiveCircleColor: Theme.of(context)
                                .sliderTheme
                                .inactiveTickMarkColor,
                            onTap: (Function(bool cancelSwitching)
                                callBack) async {
                              await DatePicker.showTimePicker(context,
                                  showSecondsColumn: false,
                                  onConfirm: (confirmTime) {
                                setState(() {
                                  timeNotification = confirmTime;
                                });
                              }, onCancel: () {
                                callBack(true);
                              },
                                  locale: LocaleType.ru,
                                  currentTime: DateTime.now(),
                                  theme: DatePickerTheme(
                                    cancelStyle:
                                        Theme.of(context).textTheme.headline2,
                                    doneStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .headline3,
                                    itemStyle:
                                        Theme.of(context).textTheme.headline2,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    headerColor:
                                        Theme.of(context).backgroundColor,
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
                              }
                            },
                            cancel: () {
                              localNotifyManager.cancelNotification(0);
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).evening,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SwitchButton(
                            activeColor:
                                Theme.of(context).sliderTheme.activeTrackColor,
                            inactiveColor: Theme.of(context)
                                .sliderTheme
                                .inactiveTrackColor,
                            activeCircleColor: Theme.of(context)
                                .sliderTheme
                                .activeTickMarkColor,
                            inactiveCircleColor: Theme.of(context)
                                .sliderTheme
                                .inactiveTickMarkColor,
                            onTap: (Function(bool cancelSwitching)
                                callBack) async {
                              await DatePicker.showTimePicker(context,
                                  showSecondsColumn: false,
                                  onConfirm: (confirmTime) {
                                setState(() {
                                  timeNotification = confirmTime;
                                });
                              }, onCancel: () {
                                callBack(true);
                              },
                                  locale: LocaleType.ru,
                                  currentTime: DateTime.now(),
                                  theme: DatePickerTheme(
                                    cancelStyle:
                                        Theme.of(context).textTheme.headline2,
                                    doneStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .headline3,
                                    itemStyle:
                                        Theme.of(context).textTheme.headline2,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    headerColor:
                                        Theme.of(context).backgroundColor,
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
                              }
                            },
                            cancel: () {
                              localNotifyManager.cancelNotification(1);
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      ButtonSave(
                        onTap: widget.onTap,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
