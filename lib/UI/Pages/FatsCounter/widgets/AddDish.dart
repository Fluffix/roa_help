import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/UI/General/widgets/FilledButton.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class AddDish extends StatefulWidget {
  final FoodItem item;
  final Function onTap;
  const AddDish({
    Key key,
    @required this.item,
    @required this.onTap,
  }) : super(key: key);

  @override
  _AddDishState createState() => _AddDishState();
}

class _AddDishState extends State<AddDish> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // elevation: 2,
      backgroundColor: Theme.of(context).backgroundColor,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.285,
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            '${widget.item.name}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .copyWith(
                                  fontSize: 18,
                                ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (widget.onTap != null) {
                              widget.onTap();
                            }
                            setState(() {});
                          },
                          child: IconSvg(
                              widget.item.inFavorites
                                  ? IconsSvg.activeStar
                                  : IconsSvg.inactiveStar,
                              width: 25,
                              color: Theme.of(context).dividerColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              color: Style.inactiveColorDark.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: TextField(
                                    autofocus: true,
                                    onEditingComplete: () {
                                      _goBack();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: textController,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(fontSize: 24),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '000',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(fontSize: 24),
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${S.of(context).gramms}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          )),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FilledButton(nameButton: S.of(context).add_dish, onTap: _goBack)
            ]),
      ),
      // content:
    );
  }

  void _goBack() {
    int out;
    if (textController.text.isNotEmpty) {
      out = int.parse(textController.text);
    }
    Navigator.pop(context, out);
  }
}
