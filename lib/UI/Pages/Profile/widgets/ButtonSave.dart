import 'package:flutter/material.dart';
import 'package:roa_help/generated/l10n.dart';

class ButtonSave extends StatefulWidget {
  final Function onTap;

  const ButtonSave({@required this.onTap});
  @override
  _ButtonSaveState createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: unnecessary_statements
        widget.onTap != null ? widget.onTap() : null;
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
