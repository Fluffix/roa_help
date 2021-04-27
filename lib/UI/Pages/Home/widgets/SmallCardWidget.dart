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
    return Container(
      width: MediaQuery.of(context).size.width * 163 / 414,
      height: 139,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).cardColor.withOpacity(0.8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: plus,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    );
  }
}
