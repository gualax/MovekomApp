
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoLimpiezaCalefEvent extends Equatable {
  ModoLimpiezaCalefEvent([List props = const []]) : super(props);
}

class Enable extends ModoLimpiezaCalefEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ModoLimpiezaCalefEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ModoLimpiezaCalefState extends Equatable {
  final bool isEnabled;

  ModoLimpiezaCalefState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoLimpiezaCalefState.initial() {
    return ModoLimpiezaCalefState(
      isEnabled: false,
    );
  }

  ModoLimpiezaCalefState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ModoLimpiezaCalefState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE

class ModoLimpiezaCalefBloc extends Bloc <ModoLimpiezaCalefEvent, ModoLimpiezaCalefState> {

  @override
  // TODO: implement initialState
  ModoLimpiezaCalefState get initialState => ModoLimpiezaCalefState.initial();

  @override
  Stream<ModoLimpiezaCalefState> mapEventToState(ModoLimpiezaCalefEvent event) async* {
    if (event is Enable) {
      yield ModoLimpiezaCalefState(
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ModoLimpiezaCalefState.initial();
    }
  }
}
