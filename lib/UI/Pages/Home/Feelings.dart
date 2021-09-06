import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Controllers/SideEffectsController.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/General/widgets/SwitchButton.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';
import 'package:roa_help/Requests/Home/Feelings/PostFeelings.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ChosenFeelingsModel.dart';

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  bool _loading = false;

  Future<void> load(GeneralController controller) async {
    setState(() {
      _loading = true;
    });
    // Request func in this place
    await sendSideEffectsRequest(
        items: chosenfeelings, token: controller.authController.data.token);
    var stats = await getStats(token: controller.authController.data.token);
    controller.sideEffectsController
        .countSideEffects(quantity: stats.countSideEffects);

    setState(() {
      _loading = false;
    });
  }

  List<ChosenFeeling> chosenfeelings = [];

  @override
  Widget build(BuildContext context) {
    final SideEffectsCategoryiesList allCats =
        ModalRoute.of(context).settings.arguments;
    var conroller = Provider.of<GeneralController>(context);
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Stack(children: [
          Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: SecondAppBar(
              text: S.of(context).feeling,
              onChange: () async {
                // ignore: await_only_futures
                if (chosenfeelings.isNotEmpty) {
                  await load(conroller);
                }
                Navigator.pop(context);
              },
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(allCats.items.length, (index) {
                        return _buildCategory(context, allCats.items[index]);
                      }),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _otherButton(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          _loading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 3,
                      sigmaY: 3,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).sliderTheme.activeTrackColor,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ]));
  }

  Widget _buildCategory(BuildContext context, CategoryItem category) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).sliderTheme.inactiveTrackColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Center(
              child: Text('${category.name}',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 16, color: Theme.of(context).selectedRowColor)),
            ),
          ),
        ),
        Column(
          children: List.generate(category.items.length, (index) {
            return Container(
              decoration: BoxDecoration(
                  border: (index + 1) != category.items.length
                      ? Border(
                          bottom: BorderSide(
                              color: Style.inactiveColorDark.withOpacity(1.0),
                              width: 0.5))
                      : null),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Color(int.parse(category.color)),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('${category.items[index].description}',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .copyWith(fontSize: 16)),
                      ],
                    ),
                    SwitchButton(
                      isActive: category.items[index].isAdded,
                      activeColor:
                          Theme.of(context).sliderTheme.activeTrackColor,
                      inactiveColor:
                          Theme.of(context).sliderTheme.inactiveTrackColor,
                      activeCircleColor:
                          Theme.of(context).sliderTheme.activeTickMarkColor,
                      inactiveCircleColor:
                          Theme.of(context).sliderTheme.inactiveTickMarkColor,
                      turnOn: () {
                        ChosenFeeling removingElement = ChosenFeeling(
                          id: 000,
                          isAdded: false,
                        );

                        //  If chosen list is empty
                        if (chosenfeelings.isEmpty) {
                          chosenfeelings.add(ChosenFeeling(
                              isAdded: true, id: category.items[index].id));
                        } else {
                          //  If user tap on switchButton 2 times
                          chosenfeelings.removeWhere((element) {
                            if (element.id != null &&
                                element.id == category.items[index].id) {
                              removingElement = element;
                            }
                            return _isNeedToRemoveWhenOn(
                              currentItem: category.items[index],
                              listItem: element,
                            );
                          });

                          // If list isn`t empty and chosen item isn`t in list
                          if (category.items[index].id != removingElement.id) {
                            chosenfeelings.add(ChosenFeeling(
                              id: category.items[index].id,
                              isAdded: true,
                            ));
                          }
                        }
                      },
                      turnOff: () {
                        ChosenFeeling removingElement = ChosenFeeling(
                          id: 000,
                          isAdded: false,
                        );

                        if (chosenfeelings.isEmpty) {
                          chosenfeelings.add(ChosenFeeling(
                            id: category.items[index].id,
                            isAdded: false,
                          ));
                        } else {
                          //  If user tap on switchButton 2 times
                          chosenfeelings.removeWhere((element) {
                            if (element.id != null &&
                                element.id == category.items[index].id) {
                              removingElement = element;
                            }
                            return _isNeedToRemoveWhenOff(
                              currentItem: category.items[index],
                              listItem: element,
                            );
                          });
                          // If list isn`t empty and chosen item isn`t in list
                          if (category.items[index].id != removingElement.id) {
                            chosenfeelings.add(ChosenFeeling(
                              id: category.items[index].id,
                              isAdded: false,
                            ));
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  bool _isNeedToRemoveWhenOn(
      {@required SideEffectItem currentItem,
      @required ChosenFeeling listItem}) {
    if (currentItem.id == listItem.id && listItem.isAdded == false) {
      return true;
    } else {
      return false;
    }
  }

  bool _isNeedToRemoveWhenOff(
      {@required SideEffectItem currentItem,
      @required ChosenFeeling listItem}) {
    if (currentItem.id == listItem.id && listItem.isAdded == true) {
      return true;
    } else {
      return false;
    }
  }

  Widget _otherButton() {
    return Container(
      width: 190,
      decoration: BoxDecoration(
          color: Theme.of(context).sliderTheme.inactiveTrackColor,
          borderRadius: BorderRadius.circular(32)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          '${S.of(context).other}',
          style: Theme.of(context).textTheme.headline6.copyWith(
              fontSize: 14, color: Theme.of(context).selectedRowColor),
        ),
      )),
    );
  }
}
