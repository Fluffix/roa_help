import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaveProgressBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class WaterConrol extends StatefulWidget {
  final Function onChange;
  final Function onRemove;

  WaterConrol({
    @required this.onChange,
    @required this.onRemove,
  });
  @override
  _WaterConrolState createState() => _WaterConrolState();
}

class _WaterConrolState extends State<WaterConrol> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).waterController;
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
            boxShadow: Theme.of(context).brightness != Brightness.dark
                ? Style.shadowCard
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
                          '${controller.data.wasDrinked}',
                          style: TextStyle(
                              color: Style.secondary,
                              fontFamily: Style.fontFamilySanFrancisco,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ' / ${controller.data.waterDayNorm} ${S.of(context).glass_3}',
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
                waterColor: Style.blue,
                heightController: controller.animationController,
                percentage: controller.data.progress,
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
