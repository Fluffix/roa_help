import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Articles/Articles.dart';
import 'package:roa_help/UI/Pages/Home/Home.dart';
import 'package:roa_help/UI/Pages/Markets/Markets.dart';
import 'package:roa_help/UI/Pages/Profile/Profile.dart';
import 'package:roa_help/UI/widgets/KeepAlivePage.dart';
import 'package:roa_help/UI/widgets/MainPanel.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ArticlesModel.dart';
import 'package:roa_help/models/WaterControlModel.dart';

class General extends StatefulWidget {
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int currentIndex;
  PageController pageControllerPage;
  ScrollController pageControllerBackground;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageControllerPage = PageController(initialPage: 0);
    pageControllerBackground = ScrollController(initialScrollOffset: 0.0);
  }

  setPage(int index) {
    currentIndex = index;
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
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageControllerBackground,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: AdaptiveTheme.of(context).theme ==
                            AdaptiveTheme.of(context).darkTheme
                        ? IconSvg(IconsSvg.backgroundDark)
                        : IconSvg(IconsSvg.backgroundLight),
                  ),
                ),
              ],
            ),
          ),
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageControllerPage,
            children: [
              KeepAlivePage(
                  child: Home(
                watercontroll: WaterControlModel(
                  wasDrinked: 0,
                ),
              )),
              KeepAlivePage(
                  child: Articles(
                items: [
                  AriclesItem(
                      icon: IconsSvg.calendar,
                      title: S.of(context).articles_head,
                      body: S.of(context).articles_body,
                      onTap: null),
                  AriclesItem(
                      icon: IconsSvg.calendar,
                      title: S.of(context).articles_head,
                      body: S.of(context).articles_body,
                      onTap: null),
                  AriclesItem(
                      icon: IconsSvg.calendar,
                      title: S.of(context).articles_head,
                      body: S.of(context).articles_body,
                      onTap: null),
                  AriclesItem(
                      icon: IconsSvg.calendar,
                      title: S.of(context).articles_head,
                      body: S.of(context).articles_body,
                      onTap: null),
                  AriclesItem(
                      icon: IconsSvg.calendar,
                      title: S.of(context).articles_head,
                      body: S.of(context).articles_body,
                      onTap: null),
                ],
              )),
              KeepAlivePage(child: Markets()),
              KeepAlivePage(child: Profile()),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MainPanel(
              height: 82,
              backgroundColor: Theme.of(context).backgroundColor,
              currentIndex: currentIndex,
              onChange: (index) {
                setState(() {
                  setPage(index);
                });
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
