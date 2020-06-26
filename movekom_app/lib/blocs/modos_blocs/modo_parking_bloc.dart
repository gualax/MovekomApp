
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoLargaDistEvent extends Equatable {
  ModoLargaDistEvent([List props = const []]) : super(props);
}

class Enable extends ModoLargaDistEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoLargaDistEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoLargaDistState extends Equatable {
  final bool isEnabled;

  ModoLargaDistState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoLargaDistState.initial() {
    return ModoLargaDistState(
      isEnabled: false,
    );
  }

  ModoLargaDistState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoLargaDistState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoLargaDistBloc extends Bloc <ModoLargaDistEvent, ModoLargaDistState> {

  @override
  // TODO: implement initialState
  ModoLargaDistState get initialState => ModoLargaDistState.initial();

  @override
  Stream<ModoLargaDistState> mapEventToState(ModoLargaDistEvent event) async* {
    if (event is Enable) {
      yield ModoLargaDistState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoLargaDistState.initial();
    }
  }
}
