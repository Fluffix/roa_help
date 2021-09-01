import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Water.dart';
import 'package:roa_help/Requests/Profile/Profile.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSettings.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsWater extends StatefulWidget {
  final Function onTapBack;
  final Function onTapChange;
  final int waterDayNorm;

  const SettingsWater(
      {Key key, this.onTapBack, this.onTapChange, @required this.waterDayNorm})
      : super(key: key);

  @override
  _SettingsWaterState createState() => _SettingsWaterState();
}

class _SettingsWaterState extends State<SettingsWater> {
  int _waterDayNorm;

  @override
  void initState() {
    super.initState();
    _waterDayNorm = widget.waterDayNorm;
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
    var controller = Provider.of<GeneralController>(context).waterController;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Theme.of(context).brightness != Brightness.dark
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
              '$_waterDayNorm '
              '${chooseEnding(_waterDayNorm)}  '
              '${S.of(context).in_the_day}',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 10,
            ),
            SfSlider(
                min: 1,
                max: 14,
                value: _waterDayNorm,
                interval: 1,
                inactiveColor: Theme.of(context).sliderTheme.inactiveTrackColor,
                activeColor: Theme.of(context).sliderTheme.activeTrackColor,
                onChanged: (dynamic waterDayNorm) {
                  setState(() {
                    _waterDayNorm = waterDayNorm.round();
                  });
                }),
            SizedBox(height: 10),
            ButtonSettings(
              titleButton: S.of(context).save,
              onTap: widget.onTapBack,
              onChange: () async {
                if (controller.data.wasDrinked > _waterDayNorm) {
                  double difference =
                      (_waterDayNorm - controller.data.wasDrinked).toDouble();
                  await changeWaterDayNorm(waterDayNorm: _waterDayNorm);
                  await waterRequest(wasDrinked: difference);
                  await controller.setDayNorm(
                      waterDayNorm: _waterDayNorm, startAnimation: false);
                  await controller.setWasDrinked(wasDrinked: _waterDayNorm);
                } else {
                  await changeWaterDayNorm(waterDayNorm: _waterDayNorm);
                  await controller.setDayNorm(
                      waterDayNorm: _waterDayNorm, startAnimation: true);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
