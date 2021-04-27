import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Home/widgets/SmallCardWidget.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaterControl.dart';
import 'package:roa_help/UI/widgets/Background.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Home extends StatefulWidget {
  int firstFats;
  int secondFats;
  int feeling;
  int recipes;
  Home({this.firstFats, this.secondFats, this.feeling, this.recipes = 8});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Background(numberPage: 0)),
            SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 32),
                  child: Column(
                    children: [
                      WaterConrol(
                        onChange: () {},
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallCardWidget(
                            onTap: () {},
                            quantity: widget.firstFats,
                            subtitlte: S.of(context).gramms_eating,
                            icon: IconSvg(
                              IconsSvg.fats,
                              width: 20,
                            ),
                            text: '${S.of(context).first_peaunts}',
                          ),
                          SmallCardWidget(
                            onTap: () {},
                            icon: IconSvg(IconsSvg.fats, width: 20),
                            subtitlte: S.of(context).gramms_eating,
                            text: '${S.of(context).second_peaunts}',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallCardWidget(
                            onTap: () {},
                            subtitlte: S.of(context).quantity_of_feelings,
                            icon: IconSvg(IconsSvg.feeling, width: 20),
                            text: '${S.of(context).feeling}',
                          ),
                          SmallCardWidget(
                            onTap: () {},
                            quantity: widget.recipes,
                            subtitlte: S.of(context).pieces,
                            icon: IconSvg(IconsSvg.recipes, width: 20),
                            text: '${S.of(context).recieps}',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
