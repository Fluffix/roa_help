import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';

class PersonalDish extends StatefulWidget {
  const PersonalDish({Key key}) : super(key: key);

  @override
  _PersonalDishState createState() => _PersonalDishState();
}

class _PersonalDishState extends State<PersonalDish> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // elevation: 2,
      backgroundColor: Theme.of(context).backgroundColor,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.32,
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
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        '${S.of(context).personal_dish}',
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
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                          color: Style.inactiveColorDark.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(14)),
                      child: TextField(
                        autofocus: true,
                        // controller: textController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: '${S.of(context).input_name}',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(fontSize: 16),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Style.inactiveColorDark.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    // controller: textController,
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
                                  '${S.of(context).fats_gramms}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _goBack();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
                  ),
                  child: Text(
                    '${S.of(context).add_dish}',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline1
                        .copyWith(fontSize: 16, color: Style.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]),
      ),
      // content:
    );
  }

  void _goBack() {
    // int out;
    // if (textController.text.isNotEmpty) {
    //   out = int.parse(textController.text);
    // }
    Navigator.pop(context);
  }
}
