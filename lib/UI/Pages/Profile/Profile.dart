import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/General/widgets/CustomAppBar.dart';
import 'package:roa_help/UI/Pages/Profile/Loguot.dart';
import 'package:roa_help/UI/Pages/Profile/SettingsNotifications.dart';
import 'package:roa_help/UI/Pages/Profile/SettingsPassword.dart';
import 'package:roa_help/UI/Pages/Profile/SettingsWater.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/CardSettings.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/CardSettingsModel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController pageControllerSettings = PageController(initialPage: 0);
  int _numberPageSettings;

  setPage(int index) {
    pageControllerSettings.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  }

  setNumberPageSettings(int numberPageSettings) {
    setState(() {
      _numberPageSettings = numberPageSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).waterController;
    return Material(
      color: Colors.transparent,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: S.of(context).settings,
          isChangeTheme: true,
          icon: Theme.of(context).brightness == Brightness.dark
              ? IconsSvg.lightMode
              : IconsSvg.darkMode,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.longestSide,
          child: PageView(
              controller: pageControllerSettings,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      CardSettings(
                        items: [
                          CardSettingsItem(
                              text: S.of(context).notification,
                              onTap: () {
                                setNumberPageSettings(0);
                                setPage(1);
                              }),
                          CardSettingsItem(
                              text: S.of(context).password,
                              onTap: () {
                                setNumberPageSettings(1);
                                setPage(1);
                              }),
                          CardSettingsItem(
                              text: S.of(context).water_norm,
                              onTap: () {
                                setNumberPageSettings(2);
                                setPage(1);
                              }),
                          CardSettingsItem(
                              text: S.of(context).log_out_of_account,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Logout();
                                  },
                                );
                                setNumberPageSettings(3);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        _numberPageSettings == 0
                            ? SettingsNotifications(onTap: () {
                                setPage(0);
                              })
                            : _numberPageSettings == 1
                                ? SettingsPassword(onTapBack: () {
                                    setPage(0);
                                  })
                                : SettingsWater(
                                    onTapBack: () {
                                      setPage(0);
                                    },
                                    waterDayNorm: controller.data.waterDayNorm,
                                  )
                      ],
                    ))
              ]),
        ),
      )),
    );
  }
}
