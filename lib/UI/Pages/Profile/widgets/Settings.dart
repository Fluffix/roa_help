import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSave.dart';
import 'package:roa_help/UI/widgets/SwitchButton.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Settings extends StatefulWidget {
  final int numberPageSettings;
  final Function onTap;

  const Settings({this.numberPageSettings, this.onTap});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  FocusNode myFocusNode;
  TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: unnecessary_statements
        widget.onTap != null ? widget.onTap() : null;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: widget.numberPageSettings == 0
            ? pageSettingsNotifications()
            : widget.numberPageSettings == 1
                ? pageSettingsMail()
                : widget.numberPageSettings == 2
                    ? pageSettingsPassword()
                    : pageSettingsWater(),
      ),
    );
  }

  // onTap: () {
  //         // ignore: unnecessary_statements
  //         widget.onTap != null ? widget.onTap() : null;
  //       },

  Widget pageSettingsNotifications() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
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
                      SwitchButton(
                        activeColor:
                            Theme.of(context).sliderTheme.activeTrackColor,
                        inactiveColor:
                            Theme.of(context).sliderTheme.inactiveTrackColor,
                        activeCircleColor:
                            Theme.of(context).sliderTheme.activeTickMarkColor,
                        inactiveCircleColor:
                            Theme.of(context).sliderTheme.inactiveTickMarkColor,
                        onTap: () {},
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).evening,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SwitchButton(
                        activeColor:
                            Theme.of(context).sliderTheme.activeTrackColor,
                        inactiveColor:
                            Theme.of(context).sliderTheme.inactiveTrackColor,
                        activeCircleColor:
                            Theme.of(context).sliderTheme.activeTickMarkColor,
                        inactiveCircleColor:
                            Theme.of(context).sliderTheme.inactiveTickMarkColor,
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  ButtonSave(onTap: widget.onTap)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageSettingsMail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: AdaptiveTheme.of(context).theme !=
                    AdaptiveTheme.of(context).darkTheme
                ? shadow
                : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).sliderTheme.inactiveTrackColor,
                        borderRadius: BorderRadius.circular(90)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: myFocusNode,
                            enabled: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'fluffix@internet.ru',
                                hintStyle: Theme.of(context).textTheme.headline2
                                // emailController.text
                                ),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(myFocusNode);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).sliderTheme.activeTrackColor,
                          borderRadius: BorderRadius.circular(90)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconSvg(IconsSvg.articles,
                            width: 20,
                            color: Theme.of(context).textTheme.headline2.color),
                      ),
                    ),
                  )
                ],
              ),
              ButtonSave(onTap: widget.onTap)
            ],
          ),
        ),
      ),
    );
  }

  Widget pageSettingsPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AdaptiveTheme.of(context).theme !=
                  AdaptiveTheme.of(context).darkTheme
              ? shadow
              : null),
      child: Column(
        children: [],
      ),
    );
  }

  Widget pageSettingsWater() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AdaptiveTheme.of(context).theme !=
                  AdaptiveTheme.of(context).darkTheme
              ? shadow
              : null),
      child: Column(
        children: [],
      ),
    );
  }
}
