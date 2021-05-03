import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Home/Home.dart';
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
                title: S.of(context).app_name,
                icon: IconsSvg.calendar,
                color: Theme.of(context).accentColor),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: CardSettings(
                    items: [
                      CardSettingsItem(text: S.of(context).notification),
                      CardSettingsItem(text: S.of(context).mail),
                      CardSettingsItem(text: S.of(context).password),
                      CardSettingsItem(text: S.of(context).city),
                      CardSettingsItem(text: S.of(context).water_norm),
                    ],
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
