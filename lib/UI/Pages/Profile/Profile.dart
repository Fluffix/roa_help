import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/CardSettings.dart';
import 'package:roa_help/UI/Pages/Profile/widgets/Settings.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController pageControllerSettings = PageController(initialPage: 0);
  int numberPageSettings;

  setPage(int index) {
    pageControllerSettings.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  }

  setPageSettins(int pageSettings) {
    setState(() {
      numberPageSettings = pageSettings;
    });
  }

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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 300 / 896,
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
                                    setPageSettins(0);
                                    setPage(1);
                                  }),
                              CardSettingsItem(
                                  text: S.of(context).mail,
                                  onTap: () {
                                    setPageSettins(1);
                                    setPage(1);
                                  }),
                              CardSettingsItem(
                                  text: S.of(context).password,
                                  onTap: () {
                                    setPageSettins(2);
                                    setPage(1);
                                  }),
                              CardSettingsItem(
                                  text: S.of(context).water_norm,
                                  onTap: () {
                                    setPageSettins(3);
                                    setPage(1);
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Settings(
                          numberPageSettings: numberPageSettings,
                          onTap: () {
                            setPage(0);
                          }),
                    )
                  ]),
            )),
      )),
    );
  }
}
