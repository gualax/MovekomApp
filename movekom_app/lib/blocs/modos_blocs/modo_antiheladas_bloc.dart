
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoAntiHeladasEvent extends Equatable {
  ModoAntiHeladasEvent([List props = const []]) : super(props);
}

class Enable extends ModoAntiHeladasEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoAntiHeladasEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoAntiHeladasBasicoState extends Equatable {
  final bool isEnabled;

  ModoAntiHeladasBasicoState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoAntiHeladasBasicoState.initial() {
    return ModoAntiHeladasBasicoState(
      isEnabled: false,
    );
  }

  ModoAntiHeladasBasicoState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoAntiHeladasBasicoState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoAntiHeladasBasicoBloc extends Bloc <ModoAntiHeladasEvent, ModoAntiHeladasBasicoState> {

  @override
  // TODO: implement initialState
  ModoAntiHeladasBasicoState get initialState => ModoAntiHeladasBasicoState.initial();

  @override
  Stream<ModoAntiHeladasBasicoState> mapEventToState(ModoAntiHeladasEvent event) async* {
    if (event is Enable) {
      yield ModoAntiHeladasBasicoState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoAntiHeladasBasicoState.initial();
    }
  }
}
