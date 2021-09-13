import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Food/Favorites.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/AddDish.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/DishItemButton.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/FavoritesAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:swipedetector/swipedetector.dart';

class Favorites extends StatefulWidget {
  final String token;
  final int mealIndex;
  final GeneralController controller;

  const Favorites({
    @required this.token,
    @required this.mealIndex,
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  GeneralController controller;
  bool _loading;
  String _token;
  int _mealIndex;
  List<FoodItem> _favoritesList;

  @override
  void initState() {
    controller = widget.controller;
    _loading = true;
    _favoritesList = [];
    _mealIndex = widget.mealIndex;
    _token = widget.token;
    load(token: _token);

    super.initState();
  }

  Future<void> load({@required String token, String date}) async {
    setState(() {
      _loading = true;
    });
    // Request func in this place
    _favoritesList = await getFavorites(token: token);
    controller.foodController.setFavoritesList(list: _favoritesList);
    log('${controller.foodController.data.favorites.length}');
    // await Future.delayed(Duration(seconds: 5));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      swipeConfiguration: SwipeConfiguration(
        horizontalSwipeMaxHeightThreshold: 10000,
        horizontalSwipeMinDisplacement: 20,
        horizontalSwipeMinVelocity: 0,
      ),
      onSwipeRight: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: FavoritesAppBar(
          text: "${S.of(context).favorites}",
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).sliderTheme.activeTrackColor,
                ),
              )
            : controller.foodController.data.favorites.isNotEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        children: List.generate(
                            controller.foodController.data.favorites.length,
                            (index) {
                          return controller.foodController.data.favorites[index]
                                  .inFavorites
                              ? DishItemButton(
                                  item: controller
                                      .foodController.data.favorites[index],
                                  isInChosen: controller.foodController
                                      .isItemInChosen(
                                          index: _mealIndex,
                                          currentItem: controller.foodController
                                              .data.favorites[index]),
                                  dishIndex: index,
                                  onTap: controller.foodController
                                          .isItemInChosen(
                                              index: _mealIndex,
                                              currentItem:
                                                  _favoritesList[index])
                                      ? () {
                                          controller.foodController
                                              .removeFromChosenList(
                                                  index: _mealIndex,
                                                  removingItem:
                                                      _favoritesList[index]);
                                          setState(() {});
                                        }
                                      : () async {
                                          int _result = await showDialog(
                                              context: context,
                                              builder: (context) => AddDish(
                                                    item: controller
                                                        .foodController
                                                        .data
                                                        .favorites[index],
                                                    onTap: () async {
                                                      controller.foodController
                                                          .favoritesControll(
                                                              index: index,
                                                              token: controller
                                                                  .authController
                                                                  .data
                                                                  .token);
                                                      setState(() {});
                                                    },
                                                  ));

                                          if (_result != null) {
                                            // Add chosen food to reciepes and counting fats
                                            int fatsWasEaten = ((_result *
                                                        _favoritesList[index]
                                                            .fat) /
                                                    100)
                                                .round();
                                            log('$fatsWasEaten');
                                            controller.foodController
                                                .addToChosenList(
                                              index: _mealIndex,
                                              amount: _result,
                                              item: _favoritesList[index],
                                              fatsWasEaten: fatsWasEaten,
                                            );
                                          }
                                          setState(() {});
                                        },
                                )
                              : SizedBox();
                        }),
                      ),
                    ),
                  )
                : Center(child: IconSvg(IconsSvg.emptyFav)),
      ),
    );
  }
}
