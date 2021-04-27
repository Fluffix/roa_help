import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Articles/widgets/CardArticles.dart';
import 'package:roa_help/UI/widgets/Background.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Background(numberPage: 1)),
          SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
                title: S.of(context).app_name,
                icon: IconsSvg.calendar,
                color: Theme.of(context).primaryColorDark),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CardArticles(),
                  CardArticles(),
                  CardArticles(),
                  CardArticles(),
                  CardArticles(),
                  CardArticles(),
                  SizedBox(
                    height: 120,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
