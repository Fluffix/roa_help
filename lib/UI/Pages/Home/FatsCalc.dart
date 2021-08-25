import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/Pages/Home/Home.dart';
import 'package:roa_help/UI/Pages/Home/widgets/BottomSheet.dart';
import 'package:roa_help/UI/widgets/Search.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ChosenFoodModel.dart';

class FatsCalc extends StatefulWidget {
  final FatsCountInfo meal;
  final FavoritesFood favoritesfood;
  const FatsCalc({Key key, @required this.meal, @required this.favoritesfood})
      : super(key: key);

  @override
  _FatsCalcState createState() => _FatsCalcState();
}

class _FatsCalcState extends State<FatsCalc> {
  GeneralController controller = GeneralController();
  TextEditingController searchController = TextEditingController();
  TextEditingController foodTextController = TextEditingController();
  List<ChosenFoodModel> chosenFoods;
  FavoritesFood favoritesFoodResult;
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
      controller.foodController.search(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    FatsCountInfo mealResult = widget.meal;
    favoritesFoodResult = widget.favoritesfood;
    chosenFoods = widget.meal.foodWasEaten;
    return Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: SecondAppBar(
                text: S.of(context).fats_calc,
                onChange: () {
                  print(mealResult.foodWasEaten);
                  int result = 0;
                  chosenFoods.forEach((element) {
                    result += element.fatsWasEaten;
                  });
                  if (result == 0) {
                    mealResult = FatsCountInfo.empty();
                    Navigator.pop(context, [mealResult, favoritesFoodResult]);
                  } else {
                    mealResult = FatsCountInfo(
                        fatsWasEaten: result, foodWasEaten: chosenFoods);
                    controller.foodController.setState();
                    Navigator.pop(context, [mealResult, favoritesFoodResult]);
                  }
                },
              ),
              body: _content(),
            ),
          ),
        ));
  }

  Widget _content() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          _search(),
          StreamBuilder<FoodState>(
            stream: controller.foodController.streamFoods,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return _results(snapshot.data);
            },
          )
        ],
      ),
    );
  }

  Widget _search() {
    return Search(
        controllerText: searchController,
        findHint: "${S.of(context).food_find}");
  }

  Widget _results(FoodState state) {
    if (state.loading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      // Food that was add
      if (searchController.text.isEmpty) {
        if (chosenFoods.isNotEmpty) {
          return Column(
            children: [
              //  Food that was add
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                    children: List.generate(chosenFoods.length, (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(
                            top: index == 0
                                ? BorderSide(
                                    color: cInactiveColorDark.withOpacity(1.0),
                                    width: 0.5)
                                : BorderSide.none,
                            bottom: BorderSide(
                                color: cInactiveColorDark.withOpacity(1.0),
                                width: 0.5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${chosenFoods[index].item.name}',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline1
                                  .copyWith(
                                    fontSize: 16,
                                  )),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              chosenFoods.remove(chosenFoods[index]);
                              setState(() {});
                            },
                            child: IconSvg(IconsSvg.remove,
                                color: cInactiveColorDark.withOpacity(1.0),
                                width: 26),
                          )
                        ],
                      ),
                    ),
                  );
                })),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      } else {
        if (state.db.foods.isEmpty) {
          return SizedBox();
        } else {
          //  When Find is not empty
          print(state.db);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
                children: List.generate(state.db.foods.length, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        top: index == 0
                            ? BorderSide(
                                color: cInactiveColorDark.withOpacity(1.0),
                                width: 0.5)
                            : BorderSide.none,
                        bottom: BorderSide(
                            color: cInactiveColorDark.withOpacity(1.0),
                            width: 0.5))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${state.db.foods[index].name}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1
                              .copyWith(
                                fontSize: 16,
                              )),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: _isChosenFood(state.db.foods[index])
                            ? () {
                                print(1);
                                chosenFoods.removeWhere((element) =>
                                    element.item.id ==
                                    state.db.foods[index].id);
                                setState(() {});
                              }
                            : () async {
                                int result = await _showBottomSheetFood(
                                    state.db.foods[index], foodTextController);
                                if (result != null) {
                                  // Add chosen food to reciepes and counting fats
                                  int fatsWasEaten =
                                      ((result * state.db.foods[index].fat) /
                                              100)
                                          .round();
                                  chosenFoods.add(ChosenFoodModel(
                                      item: state.db.foods[index],
                                      fatsWasEaten: fatsWasEaten));
                                }
                              },
                        child: IconSvg(
                            _isChosenFood(state.db.foods[index])
                                ? IconsSvg.remove
                                : IconsSvg.add,
                            color: cInactiveColorDark.withOpacity(1.0),
                            width: 26),
                      )
                    ],
                  ),
                ),
              );
            })),
          );
        }
      }
    }
  }

  Future<int> _showBottomSheetFood(
      Food item, TextEditingController textController) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(24.0),
              topRight: const Radius.circular(24.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return ContentFatsBottomSheet(
            item: item,
            // Add to Favorites
            onTap: () {
              if (item.inFavorites == true) {
                item.inFavorites = false;
                favoritesFoodResult.favorites.remove(item);
              } else {
                item.inFavorites = true;
                favoritesFoodResult.favorites.add(item);
              }
            },
          );
        });
  }

  bool _isChosenFood(Food currentItem) {
    bool result = false;
    chosenFoods.forEach((element) {
      if (element.item.id == currentItem.id) result = true;
    });
    return result;
  }
}
