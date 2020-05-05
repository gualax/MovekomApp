
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoAntiHeladasAutoEvent extends Equatable {
  ModoAntiHeladasAutoEvent([List props = const []]) : super(props);
}

class Enable extends ModoAntiHeladasAutoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoAntiHeladasAutoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoAntiHeladasAutoState extends Equatable {
  final bool isEnabled;

  ModoAntiHeladasAutoState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoAntiHeladasAutoState.initial() {
    return ModoAntiHeladasAutoState(
      isEnabled: false,
    );
  }

  ModoAntiHeladasAutoState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoAntiHeladasAutoState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoAntiHeladasAutoBloc extends Bloc <ModoAntiHeladasAutoEvent, ModoAntiHeladasAutoState> {

  @override
  // TODO: implement initialState
  ModoAntiHeladasAutoState get initialState => ModoAntiHeladasAutoState.initial();

  @override
  Stream<ModoAntiHeladasAutoState> mapEventToState(ModoAntiHeladasAutoEvent event) async* {
    if (event is Enable) {
      yield ModoAntiHeladasAutoState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoAntiHeladasAutoState.initial();
    }
  }
}
