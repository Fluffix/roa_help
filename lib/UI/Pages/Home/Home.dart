import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/AuthController.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/General/widgets/CustomAppBar.dart';
import 'package:roa_help/Requests/Home/Food/FatsCounterSerialise.dart';
import 'package:roa_help/Requests/Home/Feelings/GetFeelings.dart';
import 'package:roa_help/Requests/Home/Water.dart';
import 'package:roa_help/UI/Pages/Calendar/Calendar.dart';
import 'package:roa_help/UI/Pages/FatsCounter/FatsCalc.dart';
import 'package:roa_help/UI/Pages/Reciepes/Reciepes.dart';
import 'package:roa_help/UI/Pages/Home/widgets/SmallCardWidget.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaterControl.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/FatsCountModel.dart';

FavoritesFood favoritesFood = FavoritesFood.empty();

class Home extends StatefulWidget {
  final int firstFats;
  final int secondFats;
  final int sideEffects;
  final int recipes;

  Home({
    this.firstFats,
    this.secondFats,
    this.sideEffects,
    this.recipes = 8,
  });
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FoodItem> db;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
    return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: _customAppbar(controller.authController),
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
                    _meals(controller: controller),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _health(controller),
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

  Widget _customAppbar(AuthController controller) {
    return CustomAppBar(
      title: S.of(context).app_name,
      icon: IconsSvg.calendar,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CalendarScreen(
                      token: controller.data.token,
                    )));
      },
    );
  }

  Widget _waterControl(GeneralController controller) {
    return WaterConrol(
      onChange: () async {
        if (controller.waterController.data.wasDrinked !=
            controller.waterController.data.waterDayNorm) {
          if (controller.waterController.animationController.bezierCurveState
                  .getPercentage ==
              controller.waterController.data.wasDrinked /
                  controller.waterController.data.waterDayNorm) {
            Vibrate.feedback(FeedbackType.success);
            await waterRequest(
              wasDrinked: 1.0,
              token: controller.authController.data.token,
            );
            setState(() {
              controller.waterController.changeWasDrinkedWater(quantity: 1);
            });
          }
        }
      },
      onRemove: () async {
        if (controller.waterController.data.wasDrinked > 0) {
          if (controller.waterController.animationController.bezierCurveState
                  .getPercentage ==
              controller.waterController.data.wasDrinked /
                  controller.waterController.data.waterDayNorm) {
            Vibrate.feedback(FeedbackType.success);
            await waterRequest(
              wasDrinked: -1.0,
              token: controller.authController.data.token,
            );
            setState(() {
              controller.waterController.changeWasDrinkedWater(quantity: -1);
            });
          }
        }
      },
    );
  }

  Widget _meals({@required GeneralController controller}) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children:
          List.generate(controller.foodController.data.meals.length, (index) {
        return SmallCardWidget(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FatsCalc(
                        mealIndex: index,
                        controller: controller,
                      )),
            );
            setState(() {});
          },
          quantity: controller.foodController.data.meals[index].fatsWasEaten,
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

  Widget _health(GeneralController controller) {
    return SmallCardWidget(
      onTap: () async {
        var sideEffects =
            await getSideEffects(token: controller.authController.data.token);
        await Navigator.pushNamed(context, Routes.sideEffects,
            arguments: sideEffects);
        setState(() {});
      },
      subtitlte: S.of(context).quantity_of_feelings,
      icon: IconSvg(IconsSvg.feeling, width: 20),
      quantity: controller.sideEffectsController.data.countSideEffects != 0
          ? controller.sideEffectsController.data.countSideEffects
          : null,
      text: '${S.of(context).feeling}',
    );
  }

  Widget _reciepes() {
    return SmallCardWidget(
      onTap: () async {
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
