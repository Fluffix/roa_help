import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/CardSettings.dart';
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
      color: Colors.transparent,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: S.of(context).settings,
          icon: AdaptiveTheme.of(context).theme ==
                  AdaptiveTheme.of(context).darkTheme
              ? IconsSvg.lightMode
              : IconsSvg.darkMode,
          onTap: () {
            AdaptiveTheme.of(context).theme ==
                    AdaptiveTheme.of(context).darkTheme
                ? AdaptiveTheme.of(context).setLight()
                : AdaptiveTheme.of(context).setDark();
          },
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 32),
                CardSettings(
                  items: [
                    CardSettingsItem(text: S.of(context).notification),
                    CardSettingsItem(text: S.of(context).mail),
                    CardSettingsItem(text: S.of(context).password),
                    CardSettingsItem(text: S.of(context).water_norm),
                  ],
                ),
                SizedBox(height: 120),
              ],
            )),
      )),
    );
  }
}
