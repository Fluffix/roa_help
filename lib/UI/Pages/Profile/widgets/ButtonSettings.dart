import 'package:flutter/material.dart';

class ButtonSettings extends StatefulWidget {
  final String titleButton;
  final Function onChange;
  final Function onTap;
  final bool delayed;

  const ButtonSettings({
    @required this.titleButton,
    this.onChange,
    this.onTap,
    this.delayed = false,
  });
  @override
  _ButtonSettingsState createState() => _ButtonSettingsState();
}

class _ButtonSettingsState extends State<ButtonSettings> {
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
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: Theme.of(context).sliderTheme.activeTrackColor,
            borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(widget.titleButton,
                  style: Theme.of(context).textTheme.button),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
