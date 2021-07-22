import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Food/FoodRequestSerialise.dart';
import 'package:roa_help/UI/Pages/Calendar/Calendar.dart';
import 'package:roa_help/UI/Pages/Home/FatsCalc.dart';
import 'package:roa_help/UI/Pages/Home/Feelings.dart';
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
  List<Items> favorites;
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
  GetFood db;
  WaterController waterController = WaterController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                child: Column(
                  children: [
                    _waterControl(),
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

  Widget _waterControl() {
    return WaterConrol(
      waterControll: widget.watercontroll,
      waterController: waterController,
      onChange: () {
        if (widget.watercontroll.wasDrinked != widget.watercontroll.dayNorm) {
          // print();
          if (waterController.bezierCurveState.getPercentage() ==
              widget.watercontroll.wasDrinked / widget.watercontroll.dayNorm) {
            setState(() {
              widget.watercontroll.wasDrinked += 1.0;
              waterController.changeWaterHeight(
                  widget.watercontroll.wasDrinked /
                      widget.watercontroll.dayNorm);
            });
          }
        }
      },
      onRemove: () {
        if (widget.watercontroll.wasDrinked > 0) {
          // print();
          if (waterController.bezierCurveState.getPercentage() ==
              widget.watercontroll.wasDrinked / widget.watercontroll.dayNorm) {
            setState(() {
              widget.watercontroll.wasDrinked -= 1.0;
              waterController.changeWaterHeight(
                  widget.watercontroll.wasDrinked /
                      widget.watercontroll.dayNorm);
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
      onTap: () async {
        // db = await getFood('Яйцо');
        print(db.items[1].name);
      },
      quantity: widget.recipes,
      subtitlte: S.of(context).pieces,
      icon: IconSvg(IconsSvg.recipes, width: 20),
      text: '${S.of(context).recieps}',
    );
  }
}
