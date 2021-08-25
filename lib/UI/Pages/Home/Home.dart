import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Controllers/SettingsController.dart';
import 'package:roa_help/Requests/Food/FatsCounterSerialise.dart';
import 'package:roa_help/UI/Pages/Calendar/Calendar.dart';
import 'package:roa_help/UI/Pages/Home/FatsCalc.dart';
import 'package:roa_help/UI/Pages/Home/Feelings.dart';
import 'package:roa_help/UI/Pages/Reciepes/Reciepes.dart';
import 'package:roa_help/UI/Pages/Home/widgets/SmallCardWidget.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaterControl.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaveProgressBar.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ChosenFoodModel.dart';
import 'package:roa_help/models/WaterControlModel.dart';

class FatsCountInfo {
  int fatsWasEaten;
  List<ChosenFoodModel> foodWasEaten;
  FatsCountInfo({this.fatsWasEaten, this.foodWasEaten});
  FatsCountInfo.empty() {
    fatsWasEaten = null;
    foodWasEaten = [];
  }
}

class FavoritesFood {
  List<Food> favorites;
  FavoritesFood({this.favorites});
  FavoritesFood.empty() {
    favorites = [];
  }
}

List<FatsCountInfo> meals = [
  FatsCountInfo.empty(),
  FatsCountInfo.empty(),
];
FavoritesFood favoritesFood = FavoritesFood.empty();

class Home extends StatefulWidget {
  final WaterControlModel watercontroll;
  final int firstFats;
  final int secondFats;
  final int feeling;
  final int recipes;

  Home({
    @required this.watercontroll,
    this.firstFats,
    this.secondFats,
    this.feeling,
    this.recipes = 8,
  });
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FoodList db;
  WaterController waterController = WaterController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).settingsController;
    return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: _customAppbar(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: MediaQuery.of(context).size.width > 795
                    ? const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32)
                    : const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                child: Column(
                  children: [
                    _waterControl(controller),
                    SizedBox(
                      height: 24,
                    ),
                    _meals(),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _health(),
                        _reciepes(),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _customAppbar() {
    return CustomAppBar(
      title: S.of(context).app_name,
      icon: IconsSvg.calendar,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalendarScreen()));
      },
    );
  }

  Widget _waterControl(SettingsController controller) {
    return WaterConrol(
      waterControll: widget.watercontroll,
      waterController: waterController,
      onChange: () {
        if (widget.watercontroll.wasDrinked != controller.data.waterNormDay) {
          if (waterController.bezierCurveState.getPercentage ==
              widget.watercontroll.wasDrinked / controller.data.waterNormDay) {
            setState(() {
              widget.watercontroll.wasDrinked += 1;
              waterController.changeWaterHeight(
                  widget.watercontroll.wasDrinked /
                      controller.data.waterNormDay);
            });
          }
        }
      },
      onRemove: () {
        if (widget.watercontroll.wasDrinked > 0) {
          if (waterController.bezierCurveState.getPercentage ==
              widget.watercontroll.wasDrinked / controller.data.waterNormDay) {
            setState(() {
              widget.watercontroll.wasDrinked -= 1;
              waterController.changeWaterHeight(
                  widget.watercontroll.wasDrinked /
                      controller.data.waterNormDay);
            });
          }
        }
      },
    );
  }

  Widget _meals() {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: List.generate(meals.length, (index) {
        return SmallCardWidget(
          onTap: () async {
            List<dynamic> mealResult = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FatsCalc(
                        meal: meals[index],
                        favoritesfood: favoritesFood,
                      )),
            );
            meals[index] = mealResult[0];
            favoritesFood = mealResult[1];
            setState(() {});
          },
          quantity: meals[index].fatsWasEaten,
          subtitlte: S.of(context).gramms_eating,
          icon: IconSvg(
            IconsSvg.fats,
            width: 20,
          ),
          text: '${index + 1} ${S.of(context).meal}',
        );
      }),
    );
  }

  Widget _health() {
    return SmallCardWidget(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Feelings()));
      },
      subtitlte: S.of(context).quantity_of_feelings,
      icon: IconSvg(IconsSvg.feeling, width: 20),
      text: '${S.of(context).feeling}',
    );
  }

  Widget _reciepes() {
    return SmallCardWidget(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Reciepes()));
      },
      quantity: widget.recipes,
      subtitlte: S.of(context).pieces,
      icon: IconSvg(IconsSvg.recipes, width: 20),
      text: '${S.of(context).reciepes}',
    );
  }
}
