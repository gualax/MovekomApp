
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


class CargadorBateriaState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  CargadorBateriaState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory CargadorBateriaState.initial() {
    return CargadorBateriaState(
      isEnabled: true,
      valueAmp: 21,
    );
  }

  CargadorBateriaState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return CargadorBateriaState(
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

class CargadorBateriaBloc extends Bloc <CargadorBateriaEvent, CargadorBateriaState> {

  @override
  // TODO: implement initialState
  CargadorBateriaState get initialState => CargadorBateriaState.initial();

  @override
  Stream<CargadorBateriaState> mapEventToState(CargadorBateriaEvent event) async* {
    if (event is EnableCargador) {
      yield CargadorBateriaState.initial();
    } else if (event is DisableCargador) {
      yield CargadorBateriaState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
