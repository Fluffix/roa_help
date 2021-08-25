import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Articles/widgets/CardArticles.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ArticlesModel.dart';

class Articles extends StatefulWidget {
  const Articles({Key key, @required this.items}) : super(key: key);

  final List<AriclesItem> items;
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
            children: [
              Column(
                children: List.generate(
                    widget.items.length,
                    (index) => CardArticles(
                          item: widget.items[index],
                        )),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
