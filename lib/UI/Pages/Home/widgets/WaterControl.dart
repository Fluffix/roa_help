import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaveProgressBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/WaterControlModel.dart';

class WaterConrol extends StatefulWidget {
  final Function onChange;
  final Function onRemove;

  final WaterControlModel waterControll;
  final WaterController waterController;
  WaterConrol({
    @required this.onChange,
    @required this.onRemove,
    @required this.waterController,
    @required this.waterControll,
  });
  @override
  _WaterConrolState createState() => _WaterConrolState();
}

class _WaterConrolState extends State<WaterConrol> {
  double waterHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).settingsController;
    return GestureDetector(
      onTap: () {
        if (widget.onChange != null) {
          widget.onChange();
        }
      },
      onLongPress: () {
        if (widget.onChange != null) {
          widget.onRemove();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).cardColor,
            boxShadow: AdaptiveTheme.of(context).theme !=
                    AdaptiveTheme.of(context).darkTheme
                ? shadow
                : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconSvg(IconsSvg.waterDrop, width: 20),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        S.of(context).water_control,
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.waterControll.wasDrinked.round()}',
                          style: TextStyle(
                              color: cSecondary,
                              fontFamily: fontFamilyMedium,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ' / ${controller.data.waterNormDay} ${S.of(context).glass_3}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              WaveProgressBar(
                strokeCircleColor: Theme.of(context).disabledColor,
                flowSpeed: 0.5,
                waveDistance: 45.0,
                waterColor: cBlue,
                heightController: widget.waterController,
                percentage: waterHeight,
                size: Size(64, 64),
                textStyle: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
