
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoHighwayToHellEvent extends Equatable {
  ModoHighwayToHellEvent([List props = const []]) : super(props);
}

class Enable extends ModoHighwayToHellEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoHighwayToHellEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoHighWayToHellState extends Equatable {
  final bool isEnabled;

  ModoHighWayToHellState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoHighWayToHellState.initial() {
    return ModoHighWayToHellState(
      isEnabled: false,
    );
  }

  ModoHighWayToHellState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoHighWayToHellState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoHighwayToHellBloc extends Bloc <ModoHighwayToHellEvent, ModoHighWayToHellState> {

  @override
  // TODO: implement initialState
  ModoHighWayToHellState get initialState => ModoHighWayToHellState.initial();

  @override
  Stream<ModoHighWayToHellState> mapEventToState(ModoHighwayToHellEvent event) async* {
    if (event is Enable) {
      yield ModoHighWayToHellState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoHighWayToHellState.initial();
    }
  }
}
