import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonSave.dart';

class SettingsMail extends StatefulWidget {
  final Function onTap;

  const SettingsMail({Key key, this.onTap}) : super(key: key);

  @override
  _SettingsMailState createState() => _SettingsMailState();
}

class _SettingsMailState extends State<SettingsMail> {
  TextEditingController emailController;
  FocusNode focusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    focusNode.dispose();
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
                              color: Theme.of(context)
                                  .sliderTheme
                                  .inactiveTrackColor,
                              borderRadius: BorderRadius.circular(90)),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  focusNode: focusNode,
                                  cursorColor: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .color,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: emailController.text,
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (emailController.selection.isValid) {
                                FocusScope.of(context).unfocus();
                              } else {
                                FocusScope.of(context).requestFocus(focusNode);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .sliderTheme
                                    .activeTrackColor,
                                borderRadius: BorderRadius.circular(90)),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  emailController.selection.isValid
                                      ? 12.0
                                      : 10.0),
                              child: IconSvg(
                                  emailController.selection.isValid
                                      ? IconsSvg.cancel
                                      : IconsSvg.pencil,
                                  width: emailController.selection.isValid
                                      ? 16
                                      : 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .color),
                            ),
                          ),
                        )
                      ],
                    ),
                    ButtonSave(
                      delayed: true,
                      onChance: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                        });
                      },
                      onTap: widget.onTap,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
