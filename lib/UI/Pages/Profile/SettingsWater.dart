import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSave.dart';
import 'package:roa_help/generated/l10n.dart';

class SettingsWater extends StatefulWidget {
  final Function onTap;

  const SettingsWater({Key key, this.onTap}) : super(key: key);

  @override
  _SettingsWaterState createState() => _SettingsWaterState();
}

class _SettingsWaterState extends State<SettingsWater> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: unnecessary_statements
        widget.onTap != null ? widget.onTap() : null;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AdaptiveTheme.of(context).theme !=
                        AdaptiveTheme.of(context).darkTheme
                    ? shadow
                    : null),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).morning,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).evening,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ButtonSave(
                        onTap: widget.onTap,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
