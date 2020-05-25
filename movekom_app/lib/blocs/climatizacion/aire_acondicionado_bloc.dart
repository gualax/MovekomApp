
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AireAcondicionadoEvent extends Equatable {
  AireAcondicionadoEvent([List props = const []]) : super(props);
}

class EnableAireAcondicionado extends AireAcondicionadoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableAireAcondicionado extends AireAcondicionadoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateAireAcondicionado extends AireAcondicionadoEvent { /// Deshabilita la bateria
  // final int valueTemp;
  final double valueAngle;
  final double radAngle;
  UpdateAireAcondicionado(this.valueAngle,this.radAngle) : super([valueAngle,radAngle]);

  @override
  String toString() => 'Update  {valueAngle: $valueAngle},{radAngle: $radAngle}}' ;
}
/// Fin declaracion de eventos


class AireAcondicionadoState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueTemp;

  AireAcondicionadoState({
    @required this.isEnabled,
    @required this.valueTemp,
    @required this.valueAngle,
    @required this.radAngle,


  }) : super([isEnabled,valueTemp,valueAngle]);

  /// Valores iniciales
  factory AireAcondicionadoState.initial() {
    return AireAcondicionadoState(
      isEnabled: true,
      valueTemp: 25,
      valueAngle: 0.0,
      radAngle: 0.0,
    );
  }

  AireAcondicionadoState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
    double radAngle,
  }) {
    return AireAcondicionadoState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueTemp: valueTemp ?? this.valueTemp,
      valueAngle: valueAngle ?? this.valueAngle,
      radAngle: radAngle ?? this.radAngle,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueTemp }';
  }
}
/// FIN  declaracion de STATE

class AireAcondicionadoBloc extends Bloc <AireAcondicionadoEvent, AireAcondicionadoState> {



  @override
  // TODO: implement initialState
  AireAcondicionadoState get initialState => AireAcondicionadoState.initial();


  @override
  Stream<AireAcondicionadoState> mapEventToState(AireAcondicionadoEvent event) async* {
    if (event is EnableAireAcondicionado) {
      yield AireAcondicionadoState.initial();
    } else if (event is DisableAireAcondicionado) {
      yield AireAcondicionadoState(
        valueTemp: 0,
        valueAngle: 0.0,
        radAngle: 0.0,
        isEnabled: false,
      );
    }else if (event is UpdateAireAcondicionado){
      yield AireAcondicionadoState(
        isEnabled: true, // (_lastAngle / 6.5)
        valueTemp: 25 + (event.valueAngle / 5.5).round(),
        valueAngle: event.valueAngle,
        radAngle: event.radAngle,
      );
    }
  }
}
