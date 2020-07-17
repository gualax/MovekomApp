
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BateriaAux1Event extends Equatable {
  BateriaAux1Event([List props = const []]) : super(props);
}

class EnableBatery extends BateriaAux1Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableBatery extends BateriaAux1Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class BateriaAux1State extends Equatable {
  final bool isInitial;
  final bool isEnabled;
  final double valueBat;
  double valueVolt;
  double valueAmp;

  BateriaAux1State({
    @required this.isInitial,
    @required this.isEnabled,
    @required this.valueBat,
    @required this.valueVolt,
    @required this.valueAmp,

  }) : super([ isInitial, isEnabled]);

  /// Valores iniciales
  factory BateriaAux1State.initial() {
    return BateriaAux1State(
      isInitial: true,
      isEnabled: true,
      valueBat: 13.3,
      valueVolt: 14.4,
      valueAmp: 10.8,
    );
  }

  BateriaAux1State copyWith({
    bool isInitial,
    bool isEnabled,
    double valueBat,
    double valueVolt,
    double valueAmp,

  }) {
    return BateriaAux1State(
      isInitial: isInitial ?? this.isInitial,
      isEnabled: isEnabled ?? this.isEnabled,
      valueBat: valueBat ?? this.valueBat,
      valueVolt: valueVolt ?? this.valueVolt,
      valueAmp: valueAmp ?? this.valueAmp,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $isInitial }';
  }
}
/// FIN  declaracion de STATE

class BateriaAux1Bloc extends Bloc <BateriaAux1Event, BateriaAux1State> {



  @override
  // TODO: implement initialState
  BateriaAux1State get initialState => BateriaAux1State.initial();


  @override
  Stream<BateriaAux1State> mapEventToState(BateriaAux1Event event) async* {
    if (event is EnableBatery) {
      yield BateriaAux1State.initial();
    } else if (event is DisableBatery) {
      yield BateriaAux1State(
        valueBat: 0.0,
        valueAmp: 0.0,
        valueVolt: 0.0,
        isEnabled: false,
      );
    //  yield currentState.copyWith(valueBat: 0);
     // yield currentState.copyWith(isEnabled: false);
    }
  }
}
