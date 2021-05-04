import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/generated/l10n.dart';

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: SecondAppBar(
              isFeelings: true,
              text: S.of(context).side_effects,
            ),
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
