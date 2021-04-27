import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/Background.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Background(numberPage: 0),
            ],
          ),
        ),
      ),
    );
  }
}
