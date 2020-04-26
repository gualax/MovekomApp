
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CargadorBateriaEvent extends Equatable {
  CargadorBateriaEvent([List props = const []]) : super(props);
}

class EnableCargador extends CargadorBateriaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableCargador extends CargadorBateriaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class CrgadorBateriaState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  CrgadorBateriaState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory CrgadorBateriaState.initial() {
    return CrgadorBateriaState(
      isEnabled: true,
      valueAmp: 21,
    );
  }

  CrgadorBateriaState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return CrgadorBateriaState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueAmp: valueAmp ?? this.valueAmp,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueAmp }';
  }
}
/// FIN  declaracion de STATE

class CargadorBateriaBloc extends Bloc <CargadorBateriaEvent, CrgadorBateriaState> {

  @override
  // TODO: implement initialState
  CrgadorBateriaState get initialState => CrgadorBateriaState.initial();

  @override
  Stream<CrgadorBateriaState> mapEventToState(CargadorBateriaEvent event) async* {
    if (event is EnableCargador) {
      yield CrgadorBateriaState.initial();
    } else if (event is DisableCargador) {
      yield CrgadorBateriaState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
