import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/generated/l10n.dart';

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: SecondAppBar(
                text: S.of(context).choose_city,
                findText: S.of(context).choose_city),
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
