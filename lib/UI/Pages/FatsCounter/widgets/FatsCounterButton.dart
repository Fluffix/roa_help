import 'package:flutter/material.dart';

class FatsCounterButton extends StatelessWidget {
  const FatsCounterButton({
    @required this.width,
    @required this.color,
    @required this.text,
    @required this.textStyle,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final double width;
  final Color color;
  final String text;
  final TextStyle textStyle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
            child: Text(
          '$text',
          style: textStyle,
        )),
      ),
    );
  }
}
