import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final int icon;
  final Function onTap;
  final bool colorIsBlack;

  const CustomAppBar(
      {this.height = 100,
      @required this.title,
      this.icon,
      this.onTap,
      this.colorIsBlack = false});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width - 92,
              child: Text(widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: widget.colorIsBlack
                      ? Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Style.black)
                      : Theme.of(context).textTheme.headline1)),
          widget.icon == null
              ? SizedBox(width: 28)
              : GestureDetector(
                  onTap: () {
                    // ignore: unnecessary_statements
                    widget.onTap != null ? widget.onTap() : null;
                  },
                  child: IconSvg(widget.icon,
                      height: 28,
                      width: 28,
                      color: Theme.of(context).textTheme.headline5.color),
                )
        ],
      ),
    );
  }
}
