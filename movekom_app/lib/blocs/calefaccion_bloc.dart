
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

class UpdateCalefaccion extends CalefaccionEvent { /// Deshabilita la bateria
 // final int valueTemp;
  final double valueAngle;

  UpdateCalefaccion(this.valueAngle) : super([valueAngle]);

  @override
  String toString() => 'Update  {valueDimer: $valueAngle}}' ;
}
/// Fin declaracion de eventos


class CalefaccionState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  int valueTemp;

  CalefaccionState({
    @required this.isEnabled,
    @required this.valueTemp,
    @required this.valueAngle,

  }) : super([isEnabled,valueTemp,valueAngle]);

  /// Valores iniciales
  factory CalefaccionState.initial() {
    return CalefaccionState(
      isEnabled: true,
      valueTemp: 25,
      valueAngle: 0.0,
    );
  }

  CalefaccionState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
  }) {
    return CalefaccionState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueTemp: valueTemp ?? this.valueTemp,
      valueAngle: valueAngle ?? this.valueAngle,
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
        valueAngle: 0.0,
        isEnabled: false,
      );
    }else if (event is UpdateCalefaccion){
      yield CalefaccionState(
        isEnabled: true, // (_lastAngle / 6.5)
        valueTemp: 25 + (event.valueAngle / 6.5).round(),
        valueAngle: event.valueAngle,
      );
    }
  }
}
