import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BateriaMotorEvent extends Equatable {
  BateriaMotorEvent([List props = const []]) : super(props);
}

class EnableBatery extends BateriaMotorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableBatery extends BateriaMotorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class BateriaMotorState extends Equatable {
  final bool isInitial;
  final bool isEnabled;
  int valueBat;
  double valueVolt;
  double valueAmp;

  BateriaMotorState({
    @required this.isInitial,
    @required this.isEnabled,
    @required this.valueBat,
    @required this.valueVolt,
    @required this.valueAmp,

  }) : super([ isInitial, isEnabled]);

  /// Valores iniciales
  factory BateriaMotorState.initial() {
    return BateriaMotorState(
      isInitial: true,
      isEnabled: true,
      valueBat: 75,
      valueVolt: 11.46,
      valueAmp: 20.65,
    );
  }

  BateriaMotorState copyWith({
    bool isInitial,
    bool isEnabled,
    int valueBat,
  }) {
    return BateriaMotorState(
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

class BateriaMotorBloc extends Bloc <BateriaMotorEvent, BateriaMotorState> {



  @override
  // TODO: implement initialState
  BateriaMotorState get initialState => BateriaMotorState.initial();


  @override
  Stream<BateriaMotorState> mapEventToState(BateriaMotorEvent event) async* {
    if (event is EnableBatery) {
      yield BateriaMotorState.initial();
    } else if (event is DisableBatery) {
      yield BateriaMotorState(
        valueBat: 0,
        valueAmp: 0.0,
        valueVolt: 0.0,
        isEnabled: false,
      );
    }
  }
}
