
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Cargador220Event extends Equatable {
  Cargador220Event([List props = const []]) : super(props);
}

class EnableInversor extends Cargador220Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableInversor extends Cargador220Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class Cargador220State extends Equatable {
  final bool isEnabled;
  int valueAmp;

  Cargador220State({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory Cargador220State.initial() {
    return Cargador220State(
      isEnabled: true,
      valueAmp: 50,
    );
  }

  Cargador220State copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return Cargador220State(
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

class Cargador220Bloc extends Bloc <Cargador220Event, Cargador220State> {

  @override
  // TODO: implement initialState
  Cargador220State get initialState => Cargador220State.initial();

  @override
  Stream<Cargador220State> mapEventToState(Cargador220Event event) async* {
    if (event is EnableInversor) {
      yield Cargador220State.initial();
    } else if (event is DisableInversor) {
      yield Cargador220State(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
