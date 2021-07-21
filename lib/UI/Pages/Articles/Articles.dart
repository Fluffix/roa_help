import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Articles/widgets/CardArticles.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/generated/l10n.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: S.of(context).articles),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(7, (index) {
              if (index != 6) {
                return CardArticles();
              } else {
                return SizedBox(
                  height: 120,
                );
              }
            }),
          ),
        ),
      )),
    );
  }
}
