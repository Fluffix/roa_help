import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
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
                          .copyWith(color: cBlack)
                      : Theme.of(context).textTheme.headline1)),
          widget.icon == null
              ? SizedBox(width: 28)
              : ThemeSwitcher(
                  clipper: ThemeSwitcherBoxClipper(),
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        ThemeSwitcher.of(context).changeTheme(
                          theme: ThemeProvider.of(context).brightness ==
                                  Brightness.light
                              ? kDarkTheme
                              : kLightTheme,
                          reverseAnimation:
                              ThemeProvider.of(context).brightness ==
                                      Brightness.dark
                                  ? true
                                  : false,
                        );
                      },
                      child: IconSvg(widget.icon,
                          height: 28,
                          width: 28,
                          color: Theme.of(context).textTheme.headline5.color),
                    );
                  },
                )
        ],
      ),
    );
  }
}
