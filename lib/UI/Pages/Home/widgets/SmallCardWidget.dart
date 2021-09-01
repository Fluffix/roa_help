import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class SmallCardWidget extends StatefulWidget {
  final Widget icon;
  final String text;
  final String subtitlte;
  final int quantity;
  final bool recieps;
  final Function onTap;
  SmallCardWidget(
      {@required this.icon,
      @required this.text,
      @required this.subtitlte,
      @required this.onTap,
      this.quantity,
      this.recieps = false});
  @override
  _SmallCardWidgetState createState() => _SmallCardWidgetState();
}

class _SmallCardWidgetState extends State<SmallCardWidget> {
  final Widget plus = IconSvg(IconsSvg.plus, width: 32);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // ignore: unnecessary_statements
          widget.onTap != null ? widget.onTap() : null;
        },
        child: Container(
          width: (MediaQuery.of(context).size.width - 88) / 2,
          height: (MediaQuery.of(context).size.width - 88) / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).cardColor,
              boxShadow: Theme.of(context).brightness != Brightness.dark
                  ? Style.shadowCard
                  : null),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(children: [
              Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    children: [
                      widget.icon,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width:
                              ((MediaQuery.of(context).size.width - 88) / 2) -
                                  60,
                          child: Text(
                            '${widget.text}',
                            style: Theme.of(context).textTheme.headline2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              widget.quantity == null
                  ? Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          plus,
                        ],
                      ))
                  : Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            '${widget.quantity}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text('${widget.subtitlte}',
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    )
            ]),
          ),
        ));
  }
}
