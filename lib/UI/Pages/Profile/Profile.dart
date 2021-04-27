import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/Background.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              Background(numberPage: 3),
            ],
          ),
        ),
      ),
    );
  }
}
