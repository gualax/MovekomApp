
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AguasSuciasEvent extends Equatable {
  AguasSuciasEvent([List props = const []]) : super(props);
}

class Enable extends AguasSuciasEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends AguasSuciasEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class AguasSuciasState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  AguasSuciasState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory AguasSuciasState.initial() {
    return AguasSuciasState(
      isEnabled: true,
      valueAmp: 50,
    );
  }

  AguasSuciasState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return AguasSuciasState(
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

class AguasSuciasBloc extends Bloc <AguasSuciasEvent, AguasSuciasState> {

  @override
  // TODO: implement initialState
  AguasSuciasState get initialState => AguasSuciasState.initial();

  @override
  Stream<AguasSuciasState> mapEventToState(AguasSuciasEvent event) async* {
    if (event is Enable) {
      yield AguasSuciasState.initial();
    } else if (event is Disable) {
      yield AguasSuciasState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
