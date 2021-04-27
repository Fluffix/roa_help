import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final int icon;
  final Color color;

  const CustomAppBar(
      {this.height = 100,
      @required this.title,
      @required this.icon,
      @required this.color});

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
          Text(widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: widget.color)),
          IconSvg(widget.icon, height: 28, width: 28, color: widget.color)
        ],
      ),
    );
  }
}
