import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class DialogWaterCounter extends StatefulWidget {
  const DialogWaterCounter({Key key, this.dayNorm, this.onTap})
      : super(key: key);

  final int dayNorm;
  final Function onTap;

  @override
  _DialogWaterCounterState createState() =>
      _DialogWaterCounterState(dayNorm: dayNorm);
}

class _DialogWaterCounterState extends State<DialogWaterCounter> {
  _DialogWaterCounterState({this.dayNorm});

  int dayNorm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (dayNorm > 1) {
                  dayNorm = --dayNorm;
                }
              });
            },
            child: IconSvg(
              IconsSvg.leftArrow,
              width: 40,
              height: 40,
              color: Theme.of(context).sliderTheme.activeTrackColor,
            ),
          ),
          Text(
            '$dayNorm',
            style: Theme.of(context).textTheme.headline1,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (dayNorm < 14) {
                  dayNorm = ++dayNorm;
                }
              });
            },
            child: IconSvg(
              IconsSvg.rightArrow,
              width: 40,
              height: 40,
              color: Theme.of(context).sliderTheme.activeTrackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap();
                }
                Navigator.of(context).pop(dayNorm);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).sliderTheme.activeTrackColor,
                    borderRadius: BorderRadius.circular(90)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: IconSvg(IconsSvg.checkMark,
                      color: Theme.of(context).textTheme.headline2.color),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
