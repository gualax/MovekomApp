
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoPanelSolarEvent extends Equatable {
  ModoPanelSolarEvent([List props = const []]) : super(props);
}

class Enable extends ModoPanelSolarEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoPanelSolarEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoPanelSolarState extends Equatable {
  final bool isEnabled;

  ModoPanelSolarState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoPanelSolarState.initial() {
    return ModoPanelSolarState(
      isEnabled: false,
    );
  }

  ModoPanelSolarState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoPanelSolarState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoPanelSolarBloc extends Bloc <ModoPanelSolarEvent, ModoPanelSolarState> {

  @override
  // TODO: implement initialState
  ModoPanelSolarState get initialState => ModoPanelSolarState.initial();

  @override
  Stream<ModoPanelSolarState> mapEventToState(ModoPanelSolarEvent event) async* {
    if (event is Enable) {
      yield ModoPanelSolarState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoPanelSolarState.initial();
    }
  }
}
