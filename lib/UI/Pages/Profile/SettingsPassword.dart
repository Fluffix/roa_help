import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/ButtonNotification.dart';
import 'package:roa_help/generated/l10n.dart';

class SettingsPassword extends StatefulWidget {
  final Function onTapBack;
  final Function onTapSave;

  const SettingsPassword({Key key, this.onTapBack, this.onTapSave})
      : super(key: key);

  @override
  _SettingsPasswordState createState() => _SettingsPasswordState();
}

class _SettingsPasswordState extends State<SettingsPassword> {
  TextEditingController currentPasswordController;
  TextEditingController newPasswordController;
  TextEditingController repeatPasswordController;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: Theme.of(context).brightness != Brightness.dark
                ? shadow
                : null),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      controller: currentPasswordController,
                      // focusNode: focusNode,
                      // textAlign: TextAlign.center,
                      cursorColor:
                          Theme.of(context).sliderTheme.activeTrackColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: S.of(context).current_password,
                          hintStyle: Theme.of(context).textTheme.headline3),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )),
            ),
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
                      controller: newPasswordController,
                      // focusNode: focusNode,
                      // textAlign: TextAlign.center,
                      cursorColor:
                          Theme.of(context).sliderTheme.activeTrackColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: S.of(context).new_password,
                          hintStyle: Theme.of(context).textTheme.headline3),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )),
            ),
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
                      controller: repeatPasswordController,
                      // focusNode: focusNode,
                      // textAlign: TextAlign.center,
                      cursorColor:
                          Theme.of(context).sliderTheme.activeTrackColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: S.of(context).repeat_password,
                          hintStyle: Theme.of(context).textTheme.headline3),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonNotification(
                    titleButton: S.of(context).back, onTap: widget.onTapBack),
                ButtonNotification(
                  titleButton: S.of(context).save,
                  onTap: widget.onTapSave,
                  onChance: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
