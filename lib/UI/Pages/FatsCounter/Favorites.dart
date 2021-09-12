import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Food/FavoritesSerialise.dart';
import 'package:roa_help/Requests/Home/Food/Favorites.dart';
import 'package:roa_help/Requests/Home/Food/PostFoodFavorites.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/AddDish.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/DishItemButton.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/FavoritesAppBar.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:swipedetector/swipedetector.dart';

class Favorites extends StatefulWidget {
  final String token;
  final int mealIndex;

  const Favorites({
    @required this.token,
    @required this.mealIndex,
    Key key,
  }) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool _loading;
  String _token;
  int _mealIndex;
  List<FoodItem> _favoritesList;

  @override
  void initState() {
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
    // await Future.delayed(Duration(seconds: 5));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
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
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: List.generate(_favoritesList.length, (index) {
                      return DishItemButton(
                        item: _favoritesList[index],
                        isInChosen: controller.foodController.isItemInChosen(
                            index: _mealIndex,
                            currentItem: _favoritesList[index]),
                        dishIndex: index,
                        onTap: controller.foodController.isItemInChosen(
                                index: _mealIndex,
                                currentItem: _favoritesList[index])
                            ? () {
                                controller.foodController.removeFromChosenList(
                                    index: _mealIndex,
                                    removingItem: _favoritesList[index]);
                                setState(() {});
                              }
                            : () async {
                                int result = await showDialog(
                                    context: context,
                                    builder: (context) => AddDish(
                                          item: _favoritesList[index],
                                          onTap: () async {
                                            _favoritesList[index].inFavorites =
                                                !_favoritesList[index]
                                                    .inFavorites;
                                            await postFavFood(
                                              id: _favoritesList[index].id,
                                              add: _favoritesList[index]
                                                  .inFavorites,
                                              token: controller
                                                  .authController.data.token,
                                            );
                                          },
                                        ));
                                if (result != null) {
                                  // Add chosen food to reciepes and counting fats
                                  int fatsWasEaten =
                                      ((result * _favoritesList[index].fat) /
                                              100)
                                          .round();
                                  controller.foodController.addToChosenList(
                                    index: _mealIndex,
                                    item: _favoritesList[index],
                                    fatsWasEaten: fatsWasEaten,
                                  );
                                }
                                setState(() {});
                              },
                      );
                    }),
                  ),
                ),
              ),
      ),
    );
  }
}
