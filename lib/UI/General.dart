import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Articles/Articles.dart';
import 'package:roa_help/UI/Pages/Home/Home.dart';
import 'package:roa_help/UI/Pages/Markets/Markets.dart';
import 'package:roa_help/UI/Pages/Profile/Profile.dart';
import 'package:roa_help/UI/widgets/MainPanel.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class General extends StatefulWidget {
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int currentIndex = 0;
  PageController pageControllerPage = PageController(initialPage: 0);
  ScrollController pageControllerBackground = ScrollController();
  setPage(int index) {
    pageControllerPage.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    pageControllerBackground.animateTo(
        index * (MediaQuery.of(context).size.width / 2),
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageControllerBackground,
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        color: Theme.of(context).backgroundColor,
                        width: MediaQuery.of(context).size.width * 2.5,
                        height: MediaQuery.of(context).size.height),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 2.5,
                        child: AdaptiveTheme.of(context).theme ==
                                AdaptiveTheme.of(context).darkTheme
                            ? IconSvg(IconsSvg.backgroundDark)
                            : IconSvg(IconsSvg.backgroundLight),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageControllerPage,
            children: [
              Home(),
              Articles(),
              Markets(),
              Profile(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MainPanel(
              height: 82,
              backgroundColor: Theme.of(context).backgroundColor,
              currentIndex: currentIndex,
              onChange: (index) {
                setPage(index);
                currentIndex = index;
                setState(() {});
              },
              items: [
                ItemMainPanel(
                  iconActive: IconSvg(IconsSvg.home,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).focusColor),
                  iconInactive: IconSvg(IconsSvg.home,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).disabledColor),
                ),
                ItemMainPanel(
                    iconActive: IconSvg(IconsSvg.articles,
                        width: 32,
                        height: 32,
                        color: Theme.of(context).focusColor),
                    iconInactive: IconSvg(IconsSvg.articles,
                        width: 32,
                        height: 32,
                        color: Theme.of(context).disabledColor)),
                ItemMainPanel(
                  iconActive: IconSvg(IconsSvg.markets,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).focusColor),
                  iconInactive: IconSvg(IconsSvg.markets,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).disabledColor),
                ),
                ItemMainPanel(
                  iconActive: IconSvg(IconsSvg.person,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).focusColor),
                  iconInactive: IconSvg(IconsSvg.person,
                      width: 32,
                      height: 32,
                      color: Theme.of(context).disabledColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
