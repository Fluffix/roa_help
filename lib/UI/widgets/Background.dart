import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class Background extends StatefulWidget {
  final int numberPage;
  Background({@required this.numberPage});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme.of(context).theme ==
            AdaptiveTheme.of(context).darkTheme
        ? widget.numberPage == 0
            ? IconSvg(IconsSvg.homeDark)
            : widget.numberPage == 1
                ? IconSvg(IconsSvg.articlesDark)
                : widget.numberPage == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconSvg(IconsSvg.marketsTopDark),
                            IconSvg(IconsSvg.marketsDark)
                          ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconSvg(IconsSvg.profileTopDark),
                            IconSvg(IconsSvg.profileDark)
                          ])
        : widget.numberPage == 0
            ? IconSvg(IconsSvg.homeLight)
            : widget.numberPage == 1
                ? IconSvg(IconsSvg.articlesLight)
                : widget.numberPage == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconSvg(IconsSvg.marketsTopLight),
                            IconSvg(IconsSvg.marketsLight)
                          ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconSvg(IconsSvg.profileTopLight),
                            IconSvg(IconsSvg.profileLight)
                          ]);
  }
}
