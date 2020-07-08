

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Resistencia1Event extends Equatable {
  Resistencia1Event([List props = const []]) : super(props);
}

class Enable extends Resistencia1Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends Resistencia1Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class Resistencia1State extends Equatable {
  final bool isEnabled;

  Resistencia1State({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory Resistencia1State.initial() {
    return Resistencia1State(
      isEnabled: false,
    );
  }

  Resistencia1State copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return Resistencia1State(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class Resistencia1Bloc extends Bloc <Resistencia1Event, Resistencia1State> {

  @override
  // TODO: implement initialState
  Resistencia1State get initialState => Resistencia1State.initial();

  @override
  Stream<Resistencia1State> mapEventToState(Resistencia1Event event) async* {
    if (event is Enable) {
      yield Resistencia1State(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield Resistencia1State.initial();
    }
  }
}