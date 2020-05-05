
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoLimpiezaEvent extends Equatable {
  ModoLimpiezaEvent([List props = const []]) : super(props);
}

class Enable extends ModoLimpiezaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoLimpiezaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoLimpiezaState extends Equatable {
  final bool isEnabled;

  ModoLimpiezaState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoLimpiezaState.initial() {
    return ModoLimpiezaState(
      isEnabled: false,
    );
  }

  ModoLimpiezaState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoLimpiezaState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoLimpiezaBloc extends Bloc <ModoLimpiezaEvent, ModoLimpiezaState> {

  @override
  // TODO: implement initialState
  ModoLimpiezaState get initialState => ModoLimpiezaState.initial();

  @override
  Stream<ModoLimpiezaState> mapEventToState(ModoLimpiezaEvent event) async* {
    if (event is Enable) {
      yield ModoLimpiezaState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoLimpiezaState.initial();
    }
  }
}
