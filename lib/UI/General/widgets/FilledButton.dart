import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Style/Style.dart';

class FilledButton extends StatefulWidget {
  final String nameButton;
  final Function onTap;
  final Function onChange;
  final bool delayed;
  final bool roundBottomLeft;
  final bool roundBottomRight;

  const FilledButton({
    Key key,
    @required this.nameButton,
    @required this.onTap,
    this.onChange,
    this.delayed = false,
    this.roundBottomLeft = true,
    this.roundBottomRight = true,
  }) : super(key: key);

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.onChange != null) widget.onChange();

        if (widget.delayed)
          await Future.delayed(const Duration(milliseconds: 400));

        if (widget.onTap != null) widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.only(
              bottomLeft: widget.roundBottomLeft
                  ? Radius.circular(16.0)
                  : Radius.circular(0.0),
              bottomRight: widget.roundBottomRight
                  ? Radius.circular(16.0)
                  : Radius.circular(0.0)),
        ),
        child: Text(
          '${widget.nameButton}',
          style: Theme.of(context)
              .primaryTextTheme
              .headline1
              .copyWith(fontSize: 16, color: Style.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
