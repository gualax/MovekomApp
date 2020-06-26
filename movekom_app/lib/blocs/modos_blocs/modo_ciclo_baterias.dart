
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoCicloBatEvent extends Equatable {
  ModoCicloBatEvent([List props = const []]) : super(props);
}

class Enable extends ModoCicloBatEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoCicloBatEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoCicloBatState extends Equatable {
  final bool isEnabled;

  ModoCicloBatState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoCicloBatState.initial() {
    return ModoCicloBatState(
      isEnabled: false,
    );
  }

  ModoCicloBatState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoCicloBatState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoCicloBatBloc extends Bloc <ModoCicloBatEvent, ModoCicloBatState> {

  @override
  // TODO: implement initialState
  ModoCicloBatState get initialState => ModoCicloBatState.initial();

  @override
  Stream<ModoCicloBatState> mapEventToState(ModoCicloBatEvent event) async* {
    if (event is Enable) {
      yield ModoCicloBatState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoCicloBatState.initial();
    }
  }
}
