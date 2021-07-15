import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/UI/Requests/Food/FoodRequest.dart';
import 'package:roa_help/UI/Requests/Food/GetFood.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

import '../../Style.dart';

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final String findText;
  final bool isFeelings;
  final bool isFood;
  final Function onchange;

  final bool themeModeDark;

  const SecondAppBar({
    this.height = 150,
    this.isFeelings = false,
    this.isFood = true,
    this.findText,
    @required this.text,
    this.onchange,
    this.themeModeDark = false,
  });
  @override
  _SecondAppBarState createState() => _SecondAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _SecondAppBarState extends State<SecondAppBar> {
  GetFood db;
  TextEditingController searchController;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 58,
              ),
              Text(
                '${widget.text}',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Text(
                      '${S.of(context).done}',
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          widget.isFeelings
              ? SizedBox()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: widget.themeModeDark
                          ? Theme.of(context).disabledColor.withOpacity(0.4)
                          : Theme.of(context).disabledColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconSvg(
                          IconsSvg.find,
                          width: 20,
                          color: Theme.of(context).disabledColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 116,
                            child: TextField(
                              controller: searchController,
                              onChanged: (sting) async {
                                getFood(searchController.text.toLowerCase());
                                debouncer.run(() {
                                  setState(() async {
                                    // db = await getFood(
                                    //     searchController.text.toLowerCase());
                                    widget.isFood
                                        ? db = await getFood(
                                            searchController.text.toLowerCase())
                                        : null;

                                    print(db.items[0].name);
                                  });
                                });
                              },
                              decoration: InputDecoration(
                                hintText: widget.findText,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                                border: InputBorder.none,
                              ),
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          db != null
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  itemCount: db.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical:
                                      BorderSide(color: cWhite, width: 1))),
                          width: MediaQuery.of(context).size.width,
                          child: Text('${db.items[index].name}')),
                    );
                  },
                )
              : SizedBox()
        ],
      ),
    );
  }
}
