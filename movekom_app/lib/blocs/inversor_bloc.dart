
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class InversorEvent extends Equatable {
  InversorEvent([List props = const []]) : super(props);
}

class EnableInversor extends InversorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableInversor extends InversorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class InversorState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  InversorState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory InversorState.initial() {
    return InversorState(
      isEnabled: true,
      valueAmp: 21,
    );
  }

  InversorState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return InversorState(
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

class InversorBloc extends Bloc <InversorEvent, InversorState> {



  @override
  // TODO: implement initialState
  InversorState get initialState => InversorState.initial();


  @override
  Stream<InversorState> mapEventToState(InversorEvent event) async* {
    if (event is EnableInversor) {
      yield InversorState.initial();
    } else if (event is DisableInversor) {
      yield InversorState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
