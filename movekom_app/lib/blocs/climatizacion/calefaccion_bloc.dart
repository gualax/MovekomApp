
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
  final double radAngle;
  UpdateCalefaccion(this.valueAngle,this.radAngle) : super([valueAngle,radAngle]);

  @override
  String toString() => 'Update  {valueAngle: $valueAngle},{radAngle: $radAngle}}' ;
}


class UpdateCalefaccionTemp extends CalefaccionEvent { /// Deshabilita la bateria
  // final int valueTemp;
  final int valueTemp;
  UpdateCalefaccionTemp(this.valueTemp) : super([valueTemp]);

  @override
  String toString() => 'Update  {valueTemp: $valueTemp}}' ;
}

/// Fin declaracion de eventos



@immutable
abstract class CalefaccionState {
  bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueTemp;
  CalefaccionState({this.isEnabled, this.valueAngle,this.radAngle,this.valueTemp});
}

class InitialCalefaccionStateState extends CalefaccionState {
  InitialCalefaccionStateState( {bool isEnabled, int valueTemp,double valueAngle, double radAngle })
      : super(
    isEnabled: isEnabled ?? true,
    valueTemp: valueTemp ?? 25,
      valueAngle:  valueAngle ?? 0.0,
      radAngle:  radAngle ?? 0.0,
  );
}


class NewCalefaccionState extends CalefaccionState {
  NewCalefaccionState.fromOldSettingState(CalefaccionState oldState,
      {bool isEnabled, int valueTemp, double valueAngle ,double radAngle})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueTemp: valueTemp ?? oldState.valueTemp,
    valueAngle: valueAngle ?? oldState.valueAngle,
    radAngle: radAngle ?? oldState.radAngle,

  );
}
/*

class CalefaccionState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueTemp;

  CalefaccionState({
    @required this.isEnabled,
    @required this.valueTemp,
    @required this.valueAngle,
    @required this.radAngle,

  }) : super([isEnabled,valueTemp,valueAngle]);

  /// Valores iniciales
  factory CalefaccionState.initial() {
    return CalefaccionState(
      isEnabled: true,
      valueTemp: 25,
      valueAngle: 0.0,
      radAngle: 0.0,
    );
  }

  CalefaccionState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
    double radAngle,

  }) {
    return CalefaccionState(
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

 */
/// FIN  declaracion de STATE



class CalefaccionBloc extends Bloc <CalefaccionEvent, CalefaccionState> {



  @override
  // TODO: implement initialState
  CalefaccionState get initialState => InitialCalefaccionStateState();


  @override
  Stream<CalefaccionState> mapEventToState(CalefaccionEvent event) async* {
    if (event is EnableCalefaccion) {
      yield NewCalefaccionState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is DisableCalefaccion) {
      yield NewCalefaccionState.fromOldSettingState(state,
          isEnabled: false);
    }else if (event is UpdateCalefaccion){
      yield NewCalefaccionState.fromOldSettingState(state,
        valueAngle: event.valueAngle,
        radAngle: event.radAngle,
        valueTemp: getTemp(event.valueAngle),
      );
    }
    else if (event is UpdateCalefaccionTemp) {
      yield NewCalefaccionState.fromOldSettingState(state,
        valueTemp: event.valueTemp,
      );
    }
  }

  getTemp(valueAngle){
    int value =  25 + (valueAngle / 4.5).round();
    if( value > 35 ){
      return 35;
    }else if(value < 15){
      return 15;
    }else{
      return value;
    }
  }


  getTemp2(valueAngle){
    int value =  25 + (valueAngle / 4.5).round();
    if( value > 35 ){
      return 35;
    }else if(value < 15){
      return 15;
    }else{
      return value;
    }
  }
}
