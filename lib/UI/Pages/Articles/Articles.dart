import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/Background.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Background(numberPage: 1),
            ],
          ),
        ),
      ),
    );
  }
}
