import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/generated/l10n.dart';

class FatsCalc extends StatefulWidget {
  @override
  _FatsCalcState createState() => _FatsCalcState();
}

class _FatsCalcState extends State<FatsCalc> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: SecondAppBar(
                text: S.of(context).fats_calc,
                findText: S.of(context).food_find),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ));
  }
}
