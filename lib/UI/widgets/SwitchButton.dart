import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final Color activeCircleColor;
  final Color inactiveCircleColor;
  final double circleWidth;
  final double circleHeight;
  final Function onTap;

  const SwitchButton({
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.activeCircleColor,
    @required this.inactiveCircleColor,
    this.circleWidth = 20.0,
    this.circleHeight = 20.0,
    @required this.onTap,
  });
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActive = !isActive;
        // ignore: unnecessary_statements
        widget.onTap != null ? widget.onTap() : null;
        setState(() {});
      },
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width * 61 / 414,
        decoration: BoxDecoration(
            color: isActive ? widget.activeColor : widget.inactiveColor,
            borderRadius: BorderRadius.circular(90)),
        child: SizedBox(
          height: widget.circleHeight + 10,
          child: AnimatedPadding(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.all(isActive ? 4 : 5),
            child: Stack(children: [
              AnimatedPositioned(
                curve: Curves.ease,
                duration: Duration(milliseconds: 400),
                left: isActive
                    ? (MediaQuery.of(context).size.width * 61 / 414) -
                        widget.circleWidth -
                        10
                    : 0.0,
                child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 300),
                  width: isActive ? widget.circleWidth + 2 : widget.circleWidth,
                  height:
                      isActive ? widget.circleHeight + 2 : widget.circleHeight,
                  decoration: BoxDecoration(
                      color: isActive
                          ? widget.activeCircleColor
                          : widget.inactiveCircleColor,
                      borderRadius: BorderRadius.circular(90)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
