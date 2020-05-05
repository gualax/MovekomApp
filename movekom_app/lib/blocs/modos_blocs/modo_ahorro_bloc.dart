
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoAhorroEvent extends Equatable {
  ModoAhorroEvent([List props = const []]) : super(props);
}

class Enable extends ModoAhorroEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoAhorroEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoAhorroState extends Equatable {
  final bool isEnabled;

  ModoAhorroState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoAhorroState.initial() {
    return ModoAhorroState(
      isEnabled: false,
    );
  }

  ModoAhorroState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoAhorroState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoAhorroBloc extends Bloc <ModoAhorroEvent, ModoAhorroState> {

  @override
  // TODO: implement initialState
  ModoAhorroState get initialState => ModoAhorroState.initial();

  @override
  Stream<ModoAhorroState> mapEventToState(ModoAhorroEvent event) async* {
    if (event is Enable) {
      yield ModoAhorroState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoAhorroState.initial();
    }
  }
}
