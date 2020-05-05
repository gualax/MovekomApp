
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoEcoEvent extends Equatable {
  ModoEcoEvent([List props = const []]) : super(props);
}

class Enable extends ModoEcoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoEcoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoEcoState extends Equatable {
  final bool isEnabled;

  ModoEcoState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoEcoState.initial() {
    return ModoEcoState(
      isEnabled: false,
    );
  }

  ModoEcoState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoEcoState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoEcoBloc extends Bloc <ModoEcoEvent, ModoEcoState> {

  @override
  // TODO: implement initialState
  ModoEcoState get initialState => ModoEcoState.initial();

  @override
  Stream<ModoEcoState> mapEventToState(ModoEcoEvent event) async* {
    if (event is Enable) {
      yield ModoEcoState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoEcoState.initial();
    }
  }
}
