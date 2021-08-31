import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roa_help/generated/l10n.dart';

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final Function onChange;

  const SecondAppBar({
    this.height = 60,
    @required this.text,
    this.onChange,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 58,
              ),
              Text(
                '${widget.text}',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              GestureDetector(
                onTap: () {
                  if (widget.onChange != null) {
                    widget.onChange();
                  }
                },
                child: Column(
                  children: [
                    Text(
                      '${S.of(context).done}',
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
