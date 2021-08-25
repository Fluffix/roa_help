import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.activeCircleColor,
    @required this.inactiveCircleColor,
    this.circleWidth = 20.0,
    this.circleHeight = 20.0,
    this.turnOn,
    this.turnOnWithWait,
    this.turnOnWithWaitAndCancel,
    this.turnOff,
    this.isActive = false,
  });

  final Color activeColor;
  final Color inactiveColor;
  final Color activeCircleColor;
  final Color inactiveCircleColor;
  final double circleWidth;
  final double circleHeight;
  final Function turnOn;
  final Function turnOnWithWait;
  final Function turnOnWithWaitAndCancel;
  final Function turnOff;
  final bool isActive;

  @override
  _SwitchButtonState createState() => _SwitchButtonState(isActive: isActive);
}

class _SwitchButtonState extends State<SwitchButton> {
  _SwitchButtonState({this.isActive});

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isActive) {
          if (widget.turnOff != null) {
            await widget.turnOff();
          }
          isActive = !isActive;
        } else {
          if (widget.turnOn != null) {
            await widget.turnOn();
          }
          if (widget.turnOnWithWait != null) {
            await widget.turnOnWithWait();
          }
          if (widget.turnOnWithWaitAndCancel != null) {
            await widget.turnOnWithWaitAndCancel((cancel) {
              if (cancel) {
                isActive = !isActive;
              }
            });
          }
          isActive = !isActive;
        }
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
