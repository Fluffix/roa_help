import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/Background.dart';

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
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
              Background(numberPage: 2),
            ],
          ),
        ),
      ),
    );
  }
}
