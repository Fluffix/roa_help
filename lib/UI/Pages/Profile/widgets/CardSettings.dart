import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class CardSettingsItem {
  final String text;
  final Function onTap;
  CardSettingsItem({this.text, this.onTap});
}

class CardSettings extends StatefulWidget {
  final List<CardSettingsItem> items;

  const CardSettings({@required this.items});
  @override
  _CardSettingsState createState() => _CardSettingsState();
}

class _CardSettingsState extends State<CardSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.items.length, (index) {
            return GestureDetector(
              onTap: () {
                widget.items[index].onTap != null
                    ? widget.items[index].onTap()
                    // ignore: unnecessary_statements
                    : null;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    index == 0
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : Container(
                            height: 0.5,
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).disabledColor),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.items[index].text,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Theme.of(context)
                                          .toggleableActiveColor)),
                          IconSvg(IconsSvg.next,
                              color: Theme.of(context).toggleableActiveColor,
                              height: 16,
                              width: 16)
                        ]),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
