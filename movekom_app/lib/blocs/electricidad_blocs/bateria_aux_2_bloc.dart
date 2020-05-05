
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BateriaAux2Event extends Equatable {
  BateriaAux2Event([List props = const []]) : super(props);
}

class EnableBatery extends BateriaAux2Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableBatery extends BateriaAux2Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class BateriaAux2State extends Equatable {
  final bool isInitial;
  final bool isEnabled;
  int valueBat;
  double valueVolt;
  double valueAmp;

  BateriaAux2State({
    @required this.isInitial,
    @required this.isEnabled,
    @required this.valueBat,
    @required this.valueVolt,
    @required this.valueAmp,

  }) : super([ isInitial, isEnabled]);

  /// Valores iniciales
  factory BateriaAux2State.initial() {
    return BateriaAux2State(
      isInitial: true,
      isEnabled: true,
      valueBat: 25,
      valueVolt: 11.46,
      valueAmp: 20.65,
    );
  }

  BateriaAux2State copyWith({
    bool isInitial,
    bool isEnabled,
    int valueBat,
  }) {
    return BateriaAux2State(
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

class BateriaAux2Bloc extends Bloc <BateriaAux2Event, BateriaAux2State> {



  @override
  // TODO: implement initialState
  BateriaAux2State get initialState => BateriaAux2State.initial();


  @override
  Stream<BateriaAux2State> mapEventToState(BateriaAux2Event event) async* {
    if (event is EnableBatery) {
      yield BateriaAux2State.initial();
    } else if (event is DisableBatery) {
      yield BateriaAux2State(
        valueBat: 0,
        valueAmp: 0.0,
        valueVolt: 0.0,
        isEnabled: false,
      );
    }
  }
}
