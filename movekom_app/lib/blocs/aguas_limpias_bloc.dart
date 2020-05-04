
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AguasLimpiasEvent extends Equatable {
  AguasLimpiasEvent([List props = const []]) : super(props);
}

class Enable extends AguasLimpiasEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends AguasLimpiasEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class AguasLimpiasState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  AguasLimpiasState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory AguasLimpiasState.initial() {
    return AguasLimpiasState(
      isEnabled: true,
      valueAmp: 75,
    );
  }

  AguasLimpiasState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return AguasLimpiasState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueAmp: valueAmp ?? this.valueAmp,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueAmp }';
  }
}
/// FIN  declaracion de STATE

class AguasLimpiasBloc extends Bloc <AguasLimpiasEvent, AguasLimpiasState> {

  @override
  // TODO: implement initialState
  AguasLimpiasState get initialState => AguasLimpiasState.initial();

  @override
  Stream<AguasLimpiasState> mapEventToState(AguasLimpiasEvent event) async* {
    if (event is Enable) {
      yield AguasLimpiasState.initial();
    } else if (event is Disable) {
      yield AguasLimpiasState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
