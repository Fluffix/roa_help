import 'package:flutter/material.dart';
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
        widget.onTap != null ? widget.onTap() : null;
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 88) / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  widget.icon,
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${widget.text}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              widget.quantity == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16),
                      child: plus,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Text(
                            '${widget.quantity}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text('${widget.subtitlte}',
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
