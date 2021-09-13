import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final Function onChange;
  final bool isSecondPage;
  final bool isFatsCounterPage;
  final int mealIndex;
  final Function onFavorites;

  const SecondAppBar({
    this.height = 60,
    this.mealIndex = 0,
    @required this.text,
    this.isSecondPage = false,
    this.isFatsCounterPage = false,
    this.onChange,
    this.onFavorites,
  });
  @override
  _SecondAppBarState createState() => _SecondAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _SecondAppBarState extends State<SecondAppBar> {
  final debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isFatsCounterPage
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (widget.onFavorites != null) {
                        widget.onFavorites();
                      }
                    },
                    child: IconSvg(IconsSvg.inactiveStar,
                        width: 24,
                        color: Theme.of(context).textTheme.headline1.color),
                  )
                : SizedBox(),
            widget.isSecondPage
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: IconSvg(
                      IconsSvg.backArrow,
                    ),
                  )
                : SizedBox(),
            Text(
              '${widget.text}',
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            widget.isSecondPage
                ? SizedBox(
                    width: 24,
                  )
                : GestureDetector(
                    onTap: () {
                      if (widget.onChange != null) {
                        widget.onChange();
                      }
                    },
                    child: Text(
                      '${S.of(context).done}',
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
