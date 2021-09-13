import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:roa_help/Controllers/FoodController.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Food/PostMeal.dart';
import 'package:roa_help/UI/General/widgets/Search.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/Pages/FatsCounter/Favorites.dart';
import 'package:roa_help/UI/Pages/FatsCounter/PersonalDish.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/AddDish.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/DishItemButton.dart';
import 'package:roa_help/UI/Pages/FatsCounter/widgets/FatsCounterButton.dart';
import 'package:roa_help/Requests/Home/Food/PostFoodFavorites.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class FatsCalc extends StatefulWidget {
  final int mealIndex;
  final GeneralController controller;

  const FatsCalc({
    Key key,
    @required this.mealIndex,
    @required this.controller,
  }) : super(key: key);

  @override
  _FatsCalcState createState() => _FatsCalcState();
}

class _FatsCalcState extends State<FatsCalc> {
  GeneralController controller;
  TextEditingController searchController;
  TextEditingController foodTextController;
  int mealIndex;

  @override
  void initState() {
    super.initState();
    mealIndex = widget.mealIndex;
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
    return Material(
        color: Theme.of(context).backgroundColor,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).backgroundColor,
            floatingActionButton: _personalDishButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: SecondAppBar(
              mealIndex: mealIndex,
              isFatsCounterPage: true,
              text: S.of(context).fats_calc,
              onFavorites: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Favorites(
                        controller: controller,
                        mealIndex: widget.mealIndex,
                        token: controller.authController.data.token,
                      )),
                );
                setState(() {});
              },
              onChange: () async {
                controller.foodController.updateMealResult(mealIndex);
                await postDrug(
                  mealIndex: mealIndex,
                  meal: controller.foodController.data.meals[mealIndex],
                  token: controller.authController.data.token,
                );
                Navigator.pop(context);
              },
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  _search(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: _findContent(),
                  )),
                ]),
          ),
        ));
  }

  Widget _findContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: StreamBuilder<FoodState>(
        stream: controller.foodController.streamFoods,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return _results(snapshot.data);
        },
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
        if (controller
            .foodController.data.meals[mealIndex].foodWasEaten.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
                children: List.generate(
                    controller.foodController.data.meals[mealIndex].foodWasEaten
                        .length, (index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  controller.foodController.removeElement(
                      index: mealIndex,
                      removingItem: controller.foodController.data
                          .meals[mealIndex].foodWasEaten[index]);
                  setState(() {});
                },
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
                        Text(
                            '${controller.foodController.data.meals[mealIndex].foodWasEaten[index].item.name}',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .copyWith(
                                  fontSize: 16,
                                )),
                        GestureDetector(
                          child: IconSvg(IconsSvg.remove,
                              color: Style.inactiveColorDark.withOpacity(1.0),
                              width: 26),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })),
          );
        } else {
          return SizedBox();
        }
      } else {
        if (state.foods.isEmpty) {
          return SizedBox();
        } else {
          //  When Find is not empty
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
                children: List.generate(state.foods.length, (index) {
              return DishItemButton(
                item: state.foods[index],
                isInChosen: controller.foodController.isItemInChosen(
                    index: mealIndex, currentItem: state.foods[index]),
                dishIndex: index,
                onTap: controller.foodController.isItemInChosen(
                        index: mealIndex, currentItem: state.foods[index])
                    ? () {
                        controller.foodController.removeFromChosenList(
                            index: mealIndex, removingItem: state.foods[index]);
                        setState(() {});
                      }
                    : () async {
                        int _result = await showDialog(
                            context: context,
                            builder: (context) => AddDish(
                                  item: state.foods[index],
                                  onTap: () async {
                                    state.foods[index].inFavorites =
                                        !state.foods[index].inFavorites;
                                    await postFavFood(
                                      id: state.foods[index].id,
                                      add: state.foods[index].inFavorites,
                                      token:
                                          controller.authController.data.token,
                                    );
                                  },
                                ));
                        if (_result != null) {
                          // Add chosen food to reciepes and counting fats
                          int fatsWasEaten =
                              ((_result * state.foods[index].fat) / 100)
                                  .round();
                          controller.foodController.addToChosenList(
                            index: mealIndex,
                            item: state.foods[index],
                            amount: _result,
                            fatsWasEaten: fatsWasEaten,
                          );
                        }
                        setState(() {});
                      },
              );
            })),
          );
        }
      }
    }
  }

  Widget _personalDishButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FatsCounterButton(
        onTap: () async {
          int result = await showDialog(
              context: context, builder: (context) => PersonalDish());
        },
        width: MediaQuery.of(context).size.width,
        text: '${S.of(context).personal_dish}',
        textStyle: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
        color: Theme.of(context).hintColor,
      ),
    );
  }
}
