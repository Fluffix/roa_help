import 'package:flutter/cupertino.dart';
import 'package:roa_help/UI/Pages/Home/widgets/WaveProgressBar.dart';
import 'package:rxdart/rxdart.dart';

class StateWater {
  final int waterDayNorm;
  final int wasDrinked;
  final double progress;

  StateWater({
    @required this.waterDayNorm,
    @required this.wasDrinked,
    @required this.progress,
  });
}

class WaterController {
  WaterController({@required this.navigatorKeyWater});
  final GlobalKey<NavigatorState> navigatorKeyWater;

  int _waterDayNorm;
  int _wasDrinked;
  double _progress;

  BehaviorSubject<StateWater> _controllerWater = BehaviorSubject();
  WaterAnimationController _waterAnimationController =
      WaterAnimationController();

  ValueStream<StateWater> get stream => _controllerWater.stream;
  StateWater get data => _controllerWater.valueOrNull;
  WaterAnimationController get animationController => _waterAnimationController;

  //WATER
  Future<void> changeWasDrinkedWater({
    @required int quantity,
  }) async {
    _wasDrinked = _wasDrinked ?? 0;
    _wasDrinked += quantity;
    _startAnimation();
    setState();
  }

  Future<void> setDayNorm(
      {@required int waterDayNorm, @required bool startAnimation}) async {
    _waterDayNorm = waterDayNorm;
    if (startAnimation) {
      _startAnimation();
    }
    setState();
  }

  Future<void> setWasDrinked({@required int wasDrinked}) async {
    _wasDrinked = wasDrinked;
    _startAnimation();
    setState();
  }

  void _startAnimation() {
    _wasDrinked = _wasDrinked ?? 0;
    _waterDayNorm = _waterDayNorm ?? 8;
    _progress = _wasDrinked / _waterDayNorm;
    _waterAnimationController.changeWaterHeight(_progress);
    setState();
  }

//GENERAL
  setState() {
    StateWater state = StateWater(
      waterDayNorm: _waterDayNorm,
      wasDrinked: _wasDrinked,
      progress: _progress,
    );
    _controllerWater.sink.add(state);
  }

  dispose() {
    _controllerWater.close();
  }
}
