import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonNotification.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/DialogWaterCounter.dart';
import 'package:roa_help/generated/l10n.dart';

class SettingsWater extends StatefulWidget {
  final Function onTapBack;
  final Function onTapChange;

  const SettingsWater({Key key, this.onTapBack, this.onTapChange})
      : super(key: key);

  @override
  _SettingsWaterState createState() => _SettingsWaterState();
}

class _SettingsWaterState extends State<SettingsWater> {
  String chooseEnding(int dayNorm) {
    if (dayNorm == 1) {
      return S.of(context).glass;
    } else if (dayNorm >= 2 && dayNorm <= 4) {
      return S.of(context).glass_2;
    } else {
      return S.of(context).glass_3;
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).waterController;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 110.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: Theme.of(context).brightness != Brightness.dark
                  ? shadow
                  : null),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${S.of(context).your_norm}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${controller.data.waterNormDay} '
                    '${chooseEnding(controller.data.waterNormDay)}  '
                    '${S.of(context).in_the_day}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNotification(
                    titleButton: S.of(context).back,
                    onTap: widget.onTapBack,
                  ),
                  ButtonNotification(
                    titleButton: S.of(context).to_change,
                    onChance: () async {
                      int waterNormDay = await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return DialogWaterCounter(
                            dayNorm: controller.data.waterNormDay,
                          );
                        },
                      );
                      setState(() {});
                      controller.setDayNorm(dayNorm: waterNormDay);
                      controller.startAnimation();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
