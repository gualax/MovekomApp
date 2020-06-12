import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AlarmaEvent extends Equatable {
  AlarmaEvent([List props = const []]) : super(props);
}

class Enable extends AlarmaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends AlarmaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class AlarmaState extends Equatable {
  final bool isEnabled;

  AlarmaState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory AlarmaState.initial() {
    return AlarmaState(
      isEnabled: false,
    );
  }

  AlarmaState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return AlarmaState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class AlarmaBloc extends Bloc <AlarmaEvent, AlarmaState> {

  @override
  // TODO: implement initialState
  AlarmaState get initialState => AlarmaState.initial();

  @override
  Stream<AlarmaState> mapEventToState(AlarmaEvent event) async* {
    if (event is Enable) {
      yield AlarmaState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield AlarmaState.initial();
    }
  }
}
