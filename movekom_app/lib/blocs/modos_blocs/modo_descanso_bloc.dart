
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoDescansoEvent extends Equatable {
  ModoDescansoEvent([List props = const []]) : super(props);
}

class Enable extends ModoDescansoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoDescansoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoDescansoState extends Equatable {
  final bool isEnabled;

  ModoDescansoState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoDescansoState.initial() {
    return ModoDescansoState(
      isEnabled: false,
    );
  }

  ModoDescansoState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoDescansoState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoDescansoBloc extends Bloc <ModoDescansoEvent, ModoDescansoState> {

  @override
  // TODO: implement initialState
  ModoDescansoState get initialState => ModoDescansoState.initial();

  @override
  Stream<ModoDescansoState> mapEventToState(ModoDescansoEvent event) async* {
    if (event is Enable) {
      yield ModoDescansoState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoDescansoState.initial();
    }
  }
}
