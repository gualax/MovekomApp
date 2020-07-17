
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Resistencia2Event extends Equatable {
  Resistencia2Event([List props = const []]) : super(props);
}

class EnableRes2 extends Resistencia2Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableRes2 extends Resistencia2Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class Resistencia2State extends Equatable {
  final bool isEnabled;

  Resistencia2State({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory Resistencia2State.initial() {
    return Resistencia2State(
      isEnabled: false,
    );
  }

  Resistencia2State copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return Resistencia2State(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class Resistencia2Bloc extends Bloc <Resistencia2Event, Resistencia2State> {

  @override
  // TODO: implement initialState
  Resistencia2State get initialState => Resistencia2State.initial();

  @override
  Stream<Resistencia2State> mapEventToState(Resistencia2Event event) async* {
    if (event is EnableRes2) {
      yield Resistencia2State(
        isEnabled: true,
      );
    } else if (event is DisableRes2) {
      yield Resistencia2State.initial();
    }
  }
}