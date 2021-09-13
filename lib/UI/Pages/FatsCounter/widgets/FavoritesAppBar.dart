
import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class FavoritesAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final Function onChange;

  const FavoritesAppBar({
    this.height = 60,
    @required this.text,
    this.onChange,
  });
  @override
  _FavoritesAppBarState createState() => _FavoritesAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _FavoritesAppBarState extends State<FavoritesAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: IconSvg(
                IconsSvg.backArrow,
              ),
            ),
            Text(
              '${widget.text}',
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            SizedBox(
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
