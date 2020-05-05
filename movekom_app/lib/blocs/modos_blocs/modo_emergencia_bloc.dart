
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoEmergenciaEvent extends Equatable {
  ModoEmergenciaEvent([List props = const []]) : super(props);
}

class Enable extends ModoEmergenciaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoEmergenciaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoEmergenciaState extends Equatable {
  final bool isEnabled;

  ModoEmergenciaState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoEmergenciaState.initial() {
    return ModoEmergenciaState(
      isEnabled: false,
    );
  }

  ModoEmergenciaState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoEmergenciaState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoEmergenciaBloc extends Bloc <ModoEmergenciaEvent, ModoEmergenciaState> {

  @override
  // TODO: implement initialState
  ModoEmergenciaState get initialState => ModoEmergenciaState.initial();

  @override
  Stream<ModoEmergenciaState> mapEventToState(ModoEmergenciaEvent event) async* {
    if (event is Enable) {
      yield ModoEmergenciaState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoEmergenciaState.initial();
    }
  }
}
