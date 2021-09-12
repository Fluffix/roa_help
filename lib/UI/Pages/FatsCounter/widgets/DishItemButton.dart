import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class DishItemButton extends StatefulWidget {
  const DishItemButton(
      {@required this.onTap,
      @required this.item,
      @required this.dishIndex,
      @required this.isInChosen,
      Key key})
      : super(key: key);

  final Function onTap;
  final FoodItem item;
  final int dishIndex;
  final bool isInChosen;

  @override
  _DishItemButtonState createState() => _DishItemButtonState();
}

class _DishItemButtonState extends State<DishItemButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(
                top: widget.dishIndex == 0
                    ? BorderSide(
                        color: Style.inactiveColorDark.withOpacity(1.0),
                        width: 0.5)
                    : BorderSide.none,
                bottom: BorderSide(
                    color: Style.inactiveColorDark.withOpacity(1.0),
                    width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text('${widget.item.name}',
                    overflow: TextOverflow.ellipsis,
                    style:
                        Theme.of(context).primaryTextTheme.headline1.copyWith(
                              fontSize: 16,
                            )),
              ),
              IconSvg(widget.isInChosen ? IconsSvg.remove : IconsSvg.add,
                  color: Style.inactiveColorDark.withOpacity(1.0), width: 26)
            ],
          ),
        ),
      ),
    );
  }
}
