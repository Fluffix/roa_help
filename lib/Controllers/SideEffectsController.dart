import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class StateSideEffects {
  final int countSideEffects;

  StateSideEffects({@required this.countSideEffects});
}

class SideEffectsController {
  SideEffectsController({@required this.navigatorKeySideEffects});
  final GlobalKey<NavigatorState> navigatorKeySideEffects;

  int _countSideEffects;
  BehaviorSubject<StateSideEffects> _controllerSideEffects = BehaviorSubject();

  ValueStream<StateSideEffects> get stream => _controllerSideEffects.stream;
  StateSideEffects get data => _controllerSideEffects.valueOrNull;

  void countSideEffects({@required int quantity}) {
    _countSideEffects = quantity;
    setState();
  }

  //GENERAL
  setState() {
    StateSideEffects state =
        StateSideEffects(countSideEffects: _countSideEffects);
    _controllerSideEffects.sink.add(state);
  }

  dispose() {
    _controllerSideEffects.close();
  }
}
