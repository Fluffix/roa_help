import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/widgets/SwitchButton.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/FeelingsCategoryModel.dart';

class ChosenFeeling extends FeelingItem {
  final int categoryId;

  ChosenFeeling({@required this.categoryId, name, isChosen})
      : super(name: name, isChosen: isChosen);
}

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  bool _loading = false;

  void load() async {
    setState(() {
      _loading = true;
    });
    // Request func in this place
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _loading = false;
    });
  }

  List<ChosenFeeling> chosenfeelings = [];

  List<FeelingsCategoryModel> allCats = [
    FeelingsCategoryModel(
        categoryId: 1,
        categoryName: 'Гипервитаминоз',
        categoryColor: Color.fromRGBO(235, 61, 55, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: true),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: true),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 2,
        categoryName: 'Кожа и ее придатки',
        categoryColor: Color.fromRGBO(16, 68, 129, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 3,
        categoryName: 'Костно-мышечная система',
        categoryColor: Color.fromRGBO(252, 118, 6, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 4,
        categoryName: 'Нервная система',
        categoryColor: Color.fromRGBO(74, 182, 161, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 5,
        categoryName: 'Органы чувств',
        categoryColor: Color.fromRGBO(252, 190, 44, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 6,
        categoryName: 'Желудочно-кишечный тракт',
        categoryColor: Color.fromRGBO(124, 149, 180, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 7,
        categoryName: 'Органы дыхания',
        categoryColor: Color.fromRGBO(251, 199, 155, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 8,
        categoryName: 'Иммунная система',
        categoryColor: Color.fromRGBO(222, 122, 206, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ]),
    FeelingsCategoryModel(
        categoryId: 9,
        categoryName: 'Лабораторные показатели',
        categoryColor: Color.fromRGBO(168, 118, 82, 1.0),
        elements: [
          FeelingItem(name: 'Побочка 1', isChosen: false),
          FeelingItem(name: 'Побочка 2', isChosen: false),
          FeelingItem(name: 'Побочка 3', isChosen: false),
          FeelingItem(name: 'Побочка 4', isChosen: false),
          FeelingItem(name: 'Побочка 5', isChosen: false),
          FeelingItem(name: 'Побочка 6', isChosen: false),
          FeelingItem(name: 'Побочка 7', isChosen: false),
          FeelingItem(name: 'Побочка 8', isChosen: false),
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Stack(children: [
          SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: SecondAppBar(
                text: S.of(context).side_effects,
                onChange: () async {
                  // ignore: await_only_futures
                  await load();
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
                        children: List.generate(allCats.length, (index) {
                          return _buildCategory(context, allCats[index]);
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

  Widget _buildCategory(BuildContext context, FeelingsCategoryModel category) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).sliderTheme.inactiveTrackColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Center(
              child: Text('${category.categoryName}',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 16, color: Theme.of(context).selectedRowColor)),
            ),
          ),
        ),
        Column(
          children: List.generate(category.elements.length, (index) {
            return Container(
              decoration: BoxDecoration(
                  border: (index + 1) != category.elements.length
                      ? Border(
                          bottom: BorderSide(
                              color: cInactiveColorDark.withOpacity(1.0),
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
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: category.categoryColor,
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('${category.elements[index].name}',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .copyWith(fontSize: 16)),
                      ],
                    ),
                    SwitchButton(
                      isActive: category.elements[index].isChosen,
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
                            name: 'removingElement',
                            isChosen: false,
                            categoryId: 000);

                        //  If chosen list is empty
                        if (chosenfeelings.isEmpty) {
                          chosenfeelings.add(ChosenFeeling(
                              name: category.elements[index].name,
                              isChosen: true,
                              categoryId: category.categoryId));
                        } else {
                          //  If user tap on switchButton 2 times
                          chosenfeelings.removeWhere((element) {
                            if ((element.name != null) &&
                                (element.name ==
                                    category.elements[index].name)) {
                              removingElement = element;
                            }
                            return _isNeedToRemoveWhenOn(
                                element, category.elements[index]);
                          });

                          // If list isn`t empty and chosen item isn`t in list
                          if (category.elements[index].name !=
                              removingElement.name) {
                            chosenfeelings.add(ChosenFeeling(
                                name: category.elements[index].name,
                                isChosen: true,
                                categoryId: category.categoryId));
                          }
                        }
                      },
                      turnOff: () {
                        ChosenFeeling removingElement = ChosenFeeling(
                            name: 'removingElement',
                            isChosen: false,
                            categoryId: 000);

                        if (chosenfeelings.isEmpty) {
                          chosenfeelings.add(ChosenFeeling(
                              name: category.elements[index].name,
                              isChosen: false,
                              categoryId: category.categoryId));
                        } else {
                          //  If user tap on switchButton 2 times
                          chosenfeelings.removeWhere((element) {
                            if ((element.name != null) &
                                (element.name ==
                                    category.elements[index].name)) {
                              removingElement = element;
                            }
                            return _isNeedToRemoveWhenOff(
                                element, category.elements[index]);
                          });
                          // If list isn`t empty and chosen item isn`t in list
                          if (category.elements[index].name !=
                              removingElement.name) {
                            chosenfeelings.add(ChosenFeeling(
                                name: category.elements[index].name,
                                isChosen: false,
                                categoryId: category.categoryId));
                            print(chosenfeelings.last.name);
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
      ChosenFeeling chosenItem, FeelingItem generalListItem) {
    if ((chosenItem.name == generalListItem.name) &&
        (chosenItem.isChosen == false)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isNeedToRemoveWhenOff(
      ChosenFeeling chosenItem, FeelingItem generalListItem) {
    if ((chosenItem.name == generalListItem.name) &&
        (chosenItem.isChosen == true)) {
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
