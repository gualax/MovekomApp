
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AguasNegrasEvent extends Equatable {
  AguasNegrasEvent([List props = const []]) : super(props);
}

class Enable extends AguasNegrasEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends AguasNegrasEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class AguasNegrasState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  AguasNegrasState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory AguasNegrasState.initial() {
    return AguasNegrasState(
      isEnabled: true,
      valueAmp: 25,
    );
  }

  AguasNegrasState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return AguasNegrasState(
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

class AguasNegrasBloc extends Bloc <AguasNegrasEvent, AguasNegrasState> {

  @override
  // TODO: implement initialState
  AguasNegrasState get initialState => AguasNegrasState.initial();

  @override
  Stream<AguasNegrasState> mapEventToState(AguasNegrasEvent event) async* {
    if (event is Enable) {
      yield AguasNegrasState.initial();
    } else if (event is Disable) {
      yield AguasNegrasState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
