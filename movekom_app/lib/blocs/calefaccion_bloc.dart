
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CalefaccionEvent extends Equatable {
  CalefaccionEvent([List props = const []]) : super(props);
}

class EnableCalefaccion extends CalefaccionEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableCalefaccion extends CalefaccionEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class CalefaccionState extends Equatable {
  final bool isEnabled;
  int valueTemp;

  CalefaccionState({
    @required this.isEnabled,
    @required this.valueTemp,

  }) : super([isEnabled,valueTemp]);

  /// Valores iniciales
  factory CalefaccionState.initial() {
    return CalefaccionState(
      isEnabled: true,
      valueTemp: 21,
    );
  }

  CalefaccionState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return CalefaccionState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueTemp: valueTemp ?? this.valueTemp,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueTemp }';
  }
}
/// FIN  declaracion de STATE

class CalefaccionBloc extends Bloc <CalefaccionEvent, CalefaccionState> {



  @override
  // TODO: implement initialState
  CalefaccionState get initialState => CalefaccionState.initial();


  @override
  Stream<CalefaccionState> mapEventToState(CalefaccionEvent event) async* {
    if (event is EnableCalefaccion) {
      yield CalefaccionState.initial();
    } else if (event is DisableCalefaccion) {
      yield CalefaccionState(
        valueTemp: 0,
        isEnabled: false,
      );
    }
  }
}
