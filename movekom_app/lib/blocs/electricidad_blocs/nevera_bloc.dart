import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NeveraEvent extends Equatable {
  NeveraEvent([List props = const []]) : super(props);
}

class EnableNevera extends NeveraEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableNevera extends NeveraEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateNevera extends NeveraEvent { /// Deshabilita la bateria
  // final int valueTemp;
  final double valueAngle;
  final double radAngle;
  UpdateNevera(this.valueAngle,this.radAngle) : super([valueAngle,radAngle]);

  @override
  String toString() => 'Update  {valueAngle: $valueAngle},{radAngle: $radAngle}}' ;
}
/// Fin declaracion de eventos


class NeveraState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueExt;

  NeveraState({
    @required this.isEnabled,
    @required this.valueExt,
    @required this.valueAngle,
    @required this.radAngle,


  }) : super([isEnabled,valueExt,valueAngle]);

  /// Valores iniciales
  factory NeveraState.initial() {
    return NeveraState(
      isEnabled: true,
      valueExt: 25,
      valueAngle: 0.0,
      radAngle: 0.0,
    );
  }

  NeveraState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
    double radAngle,
  }) {
    return NeveraState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueExt: valueExt ?? this.valueExt,
      valueAngle: valueAngle ?? this.valueAngle,
      radAngle: radAngle ?? this.radAngle,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueExt }';
  }
}
/// FIN  declaracion de STATE

class NeveraBloc extends Bloc <NeveraEvent, NeveraState> {



  @override
  // TODO: implement initialState
  NeveraState get initialState => NeveraState.initial();


  @override
  Stream<NeveraState> mapEventToState(NeveraEvent event) async* {
    if (event is EnableNevera) {
      yield NeveraState.initial();
    } else if (event is DisableNevera) {
      yield NeveraState(
        valueExt: 0,
        valueAngle: 0.0,
        radAngle: 0.0,
        isEnabled: false,
      );
    }else if (event is UpdateNevera){
      yield NeveraState(
        isEnabled: true, // (_lastAngle / 6.5)
        valueExt: 25 + (event.valueAngle / 5.5).round(),
        valueAngle: event.valueAngle,
        radAngle: event.radAngle,
      );
    }
  }
}
