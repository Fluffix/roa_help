import 'package:flutter/material.dart';

class ButtonNotification extends StatefulWidget {
  final String titleButton;
  final Function onChance;
  final Function onTap;
  final bool delayed;

  const ButtonNotification({
    @required this.titleButton,
    this.onChance,
    this.onTap,
    this.delayed = false,
  });
  @override
  _ButtonNotificationState createState() => _ButtonNotificationState();
}

class _ButtonNotificationState extends State<ButtonNotification> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.onChance != null) widget.onChance();
        
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
