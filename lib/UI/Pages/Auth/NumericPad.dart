import 'package:flutter/material.dart';

class NumericPad extends StatelessWidget {
  final Function(int) onNumberSelected;
  final Function onBotTap;
  NumericPad({this.onNumberSelected, this.onBotTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildKeyNum(context, 1),
                  _buildKeyNum(context, 2),
                  _buildKeyNum(context, 3),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildKeyNum(context, 4),
                  _buildKeyNum(context, 5),
                  _buildKeyNum(context, 6),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildKeyNum(context, 7),
                  _buildKeyNum(context, 8),
                  _buildKeyNum(context, 9),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBotSpace(context),
                  _buildKeyNum(context, 0),
                  _buildBackSpace(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyNum(BuildContext context, int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
              child: Text(
                '${number.toString()}',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 28),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackSpace(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Icon(
              Icons.backspace,
              size: 28,
              color: Theme.of(context).iconTheme.color,
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildBotSpace(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onBotTap != null) {
            onBotTap();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Icon(
              Icons.smart_toy,
              size: 28,
              color: Theme.of(context).iconTheme.color,
            )),
          ),
        ),
      ),
    );
  }
}
