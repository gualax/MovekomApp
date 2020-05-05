
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoParkingEvent extends Equatable {
  ModoParkingEvent([List props = const []]) : super(props);
}

class Enable extends ModoParkingEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoParkingEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoParkingState extends Equatable {
  final bool isEnabled;

  ModoParkingState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoParkingState.initial() {
    return ModoParkingState(
      isEnabled: false,
    );
  }

  ModoParkingState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoParkingState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoParkingBloc extends Bloc <ModoParkingEvent, ModoParkingState> {

  @override
  // TODO: implement initialState
  ModoParkingState get initialState => ModoParkingState.initial();

  @override
  Stream<ModoParkingState> mapEventToState(ModoParkingEvent event) async* {
    if (event is Enable) {
      yield ModoParkingState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoParkingState.initial();
    }
  }
}
