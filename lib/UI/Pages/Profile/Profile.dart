import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/CardSettings.dart';
import 'package:roa_help/UI/widgets/Background.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Background(numberPage: 3)),
          SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
                title: S.of(context).roa_help,
                icon: IconsSvg.calendar,
                color: Theme.of(context).accentColor),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: CardSettings()),
          ))
        ],
      ),
    );
  }
}
