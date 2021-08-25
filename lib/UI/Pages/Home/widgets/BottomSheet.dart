import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roa_help/Requests/Food/FoodRequestSerialise.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class ContentFatsBottomSheet extends StatefulWidget {
  final Items item;
  final Function onTap;
  const ContentFatsBottomSheet(
      {Key key, @required this.item, @required this.onTap})
      : super(key: key);

  @override
  ContentFatsBottomSheetState createState() => ContentFatsBottomSheetState();
}

class ContentFatsBottomSheetState extends State<ContentFatsBottomSheet> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: MediaQuery.of(context).size.height / 3.75 +
              MediaQuery.of(context).viewInsets.bottom,
          decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24.0),
                  topRight: const Radius.circular(24.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      '${widget.item.name}',
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap();
                        }
                        print(widget.item.inFavorites);
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
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              color: cInactiveColorMark,
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
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            int out;
                            if (textController.text.isNotEmpty) {
                              out = int.parse(textController.text);
                            }
                            Navigator.pop(context, out);
                          },
                          child: Container(
                            width: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context).dividerColor),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                  child: IconSvg(
                                IconsSvg.checkMark,
                                color: cWhite,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
