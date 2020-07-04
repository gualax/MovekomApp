
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AlternadorEvent extends Equatable {
  AlternadorEvent([List props = const []]) : super(props);
}

class EnableInversor extends AlternadorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableInversor extends AlternadorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class AlternadorState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  AlternadorState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory AlternadorState.initial() {
    return AlternadorState(
      isEnabled: true,
      valueAmp: 70,
    );
  }

  AlternadorState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return AlternadorState(
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

class AlternadorBloc extends Bloc <AlternadorEvent, AlternadorState> {
  
  @override
  // TODO: implement initialState
  AlternadorState get initialState => AlternadorState.initial();

  @override
  Stream<AlternadorState> mapEventToState(AlternadorEvent event) async* {
    if (event is EnableInversor) {
      yield AlternadorState.initial();
    } else if (event is DisableInversor) {
      yield AlternadorState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
