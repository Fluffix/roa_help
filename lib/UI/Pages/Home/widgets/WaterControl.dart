import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class WaterConrol extends StatefulWidget {
  Function onChange;
  WaterConrol({@required this.onChange});
  @override
  _WaterConrolState createState() => _WaterConrolState();
}

class _WaterConrolState extends State<WaterConrol> {
  double waterHeight = 0.0;
  WaterController waterController = WaterController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        waterController.changeWaterHeight(0.3);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 351 / 414,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).cardColor.withOpacity(0.8)),
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
                        S.of(context).waterControl,
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
                          '2',
                          style: TextStyle(
                              color: cSecondary,
                              fontFamily: fontFamilyMedium,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ' / 8 ${S.of(context).glasses}',
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
                heightController: waterController,
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
