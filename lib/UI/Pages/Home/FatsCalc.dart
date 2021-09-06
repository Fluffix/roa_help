import 'package:flutter/material.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/General/widgets/Search.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/Pages/Home/widgets/AddDish.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Food/PostFoodFavorites.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/FatsCountModel.dart';

class FatsCalc extends StatefulWidget {
  final FatsCountInfo meal;
  final FavoritesFood favoritesfood;
  final GeneralController controller;

  const FatsCalc({
    Key key,
    @required this.meal,
    @required this.favoritesfood,
    @required this.controller,
  }) : super(key: key);

  @override
  _FatsCalcState createState() => _FatsCalcState();
}

class _FatsCalcState extends State<FatsCalc> {
  GeneralController controller;
  TextEditingController searchController;
  TextEditingController foodTextController;
  List<ChosenFoodModel> chosenFoods;
  FavoritesFood favoritesFoodResult;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    searchController = TextEditingController();
    foodTextController = TextEditingController();
    searchController.addListener(() {
      setState(() {});
      controller.foodController.search(
        text: searchController.text,
        token: controller.authController.data.token,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    FatsCountInfo mealResult = widget.meal;
    favoritesFoodResult = widget.favoritesfood;
    chosenFoods = widget.meal.foodWasEaten;
    return Material(
        color: Theme.of(context).backgroundColor,
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
        ));
  }

  Widget _content() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
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
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      chosenFoods.remove(chosenFoods[index]);
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border(
                              top: index == 0
                                  ? BorderSide(
                                      color: Style.inactiveColorDark
                                          .withOpacity(1.0),
                                      width: 0.5)
                                  : BorderSide.none,
                              bottom: BorderSide(
                                  color:
                                      Style.inactiveColorDark.withOpacity(1.0),
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
                              child: IconSvg(IconsSvg.remove,
                                  color:
                                      Style.inactiveColorDark.withOpacity(1.0),
                                  width: 26),
                            )
                          ],
                        ),
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
        if (state.foods.isEmpty) {
          return SizedBox();
        } else {
          //  When Find is not empty
          print(state.foods);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
                children: List.generate(state.foods.length, (index) {
              return GestureDetector(
                onTap: _isChosenFood(state.foods[index])
                    ? () {
                        print(1);
                        chosenFoods.removeWhere((element) =>
                            element.item.id == state.foods[index].id);
                        setState(() {});
                      }
                    : () async {
                        int result = await showDialog(
                            context: context,
                            builder: (context) => AddDish(
                                  item: state.foods[index],
                                  onTap: () async {
                                    if (state.foods[index].inFavorites ==
                                        true) {
                                      state.foods[index].inFavorites = false;
                                      favoritesFoodResult.favorites
                                          .remove(state.foods[index]);
                                    } else {
                                      state.foods[index].inFavorites = true;
                                      favoritesFoodResult.favorites
                                          .add(state.foods[index]);
                                    }
                                    await postFavFood(
                                      id: state.foods[index].id,
                                      add: state.foods[index].inFavorites,
                                      token:
                                          controller.authController.data.token,
                                    );
                                  },
                                ));
                        if (result != null) {
                          // Add chosen food to reciepes and counting fats
                          int fatsWasEaten =
                              ((result * state.foods[index].fat) / 100).round();
                          chosenFoods.add(ChosenFoodModel(
                              item: state.foods[index],
                              fatsWasEaten: fatsWasEaten));
                        }
                      },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                          top: index == 0
                              ? BorderSide(
                                  color:
                                      Style.inactiveColorDark.withOpacity(1.0),
                                  width: 0.5)
                              : BorderSide.none,
                          bottom: BorderSide(
                              color: Style.inactiveColorDark.withOpacity(1.0),
                              width: 0.5))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text('${state.foods[index].name}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline1
                                  .copyWith(
                                    fontSize: 16,
                                  )),
                        ),
                        IconSvg(
                            _isChosenFood(state.foods[index])
                                ? IconsSvg.remove
                                : IconsSvg.add,
                            color: Style.inactiveColorDark.withOpacity(1.0),
                            width: 26)
                      ],
                    ),
                  ),
                ),
              );
            })),
          );
        }
      }
    }
  }

  bool _isChosenFood(FoodItem currentItem) {
    bool result = false;
    chosenFoods.forEach((element) {
      if (element.item.id == currentItem.id) result = true;
    });
    return result;
  }
}
