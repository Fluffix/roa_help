import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final String findText;

  final bool isFeelings;

  const SecondAppBar({
    this.height = 150,
    this.isFeelings = false,
    this.findText,
    @required this.text,
  });
  @override
  _SecondAppBarState createState() => _SecondAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SecondAppBarState extends State<SecondAppBar> {
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
                  Navigator.pop(context);
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
          SizedBox(
            height: 24,
          ),
          widget.isFeelings
              ? SizedBox()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconSvg(
                          IconsSvg.find,
                          width: 20,
                          color: Theme.of(context).disabledColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 116,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: widget.findText,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                                border: InputBorder.none,
                              ),
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
