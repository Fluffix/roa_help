import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonNotification.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsWater extends StatefulWidget {
  final Function onTapBack;
  final Function onTapChange;
  final int waterNormDay;

  const SettingsWater(
      {Key key, this.onTapBack, this.onTapChange, @required this.waterNormDay})
      : super(key: key);

  @override
  _SettingsWaterState createState() => _SettingsWaterState();
}

class _SettingsWaterState extends State<SettingsWater> {
  int _waterNormDay;

  @override
  void initState() {
    super.initState();
    _waterNormDay = widget.waterNormDay;
  }

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
            Text(
              '${S.of(context).your_norm}',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$_waterNormDay '
              '${chooseEnding(_waterNormDay)}  '
              '${S.of(context).in_the_day}',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 10,
            ),
            SfSlider(
                min: 1,
                max: 14,
                value: _waterNormDay,
                interval: 1,
                inactiveColor: Theme.of(context).sliderTheme.inactiveTrackColor,
                activeColor: Theme.of(context).sliderTheme.activeTrackColor,
                onChanged: (dynamic value) {
                  setState(() {
                    _waterNormDay = value.round();
                  });
                }),
            SizedBox(height: 10),
            ButtonNotification(
              titleButton: S.of(context).back,
              onTap: widget.onTapBack,
              onChance: () async {
                setState(() {
                  controller.saveDayNorm(
                      key: 'waterNormDay', waterNormDay: _waterNormDay);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
