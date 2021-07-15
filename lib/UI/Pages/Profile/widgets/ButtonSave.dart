import 'package:flutter/material.dart';
import 'package:roa_help/generated/l10n.dart';

class ButtonSave extends StatefulWidget {
  final Function onChance;
  final Function onTap;
  final bool delayed;

  const ButtonSave({this.onChance, @required this.onTap, this.delayed = false});
  @override
  _ButtonSaveState createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
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
              child: Text(S.of(context).save,
                  style: Theme.of(context).textTheme.button),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
