import 'package:flutter/cupertino.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaveProgressBar.dart';
import 'package:rxdart/rxdart.dart';

class StateWater {
  final int waterNormDay;
  final int wasDrinked;
  final double progress;

  StateWater({
    @required this.waterNormDay,
    @required this.wasDrinked,
    @required this.progress,
  });
}

class WaterController {
  WaterController({@required this.navigatorKeyWater});
  final GlobalKey<NavigatorState> navigatorKeyWater;

  int _waterNormDay;
  int _wasDrinked;
  double _progress;

  BehaviorSubject<StateWater> _controllerWater = BehaviorSubject();
  WaterAnimationController _waterAnimationController =
      WaterAnimationController();

  ValueStream<StateWater> get stream => _controllerWater.stream;
  StateWater get data => _controllerWater.valueOrNull;
  WaterAnimationController get animationController => _waterAnimationController;
  int get getWaterDayNorm => _waterNormDay;

  //FUNCTIONS
  void changeWasDrinkedWater({
    @required int quantity,
  }) {
    _wasDrinked = _wasDrinked ?? 0;
    _wasDrinked += quantity;
    startAnimation();
    setState();
  }

  void setWasDrinked({@required int wasDrinked}) {
    _wasDrinked = wasDrinked;
    setState();
  }

  void setDayNorm({@required int dayNorm}) {
    _waterNormDay = dayNorm;
    setState();
  }

  void startAnimation() {
    _progress = _wasDrinked / _waterNormDay;
    _waterAnimationController.changeWaterHeight(_progress);
    setState();
  }

//GENERAL
  setState() {
    StateWater state = StateWater(
      waterNormDay: _waterNormDay,
      wasDrinked: _wasDrinked,
      progress: _progress,
    );
    _controllerWater.sink.add(state);
  }

  dispose() {
    _controllerWater.close();
  }
}
