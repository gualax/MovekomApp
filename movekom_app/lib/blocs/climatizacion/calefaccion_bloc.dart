
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

class AddedWWToCarousel extends CalefaccionEvent {  /// Habilita la bateria
 final bool isAdded;
 AddedWWToCarousel(this.isAdded) : super([isAdded]);
  @override
  String toString() => 'AddedWWToCarousel : $isAdded ';
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

/// Fin declaracion de eventos





class CalefaccionState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueTemp;
  final bool isAddedToCarousel;

  CalefaccionState({
    @required this.isEnabled,
    @required this.valueTemp,
    @required this.valueAngle,
    @required this.radAngle,
     this.isAddedToCarousel,

  }) : super([isEnabled,valueTemp,valueAngle,isAddedToCarousel]);

  /// Valores iniciales
  factory CalefaccionState.initial() {
    return CalefaccionState(
      isEnabled: true,
      valueTemp: 25,
      valueAngle: 0.0,
      radAngle: 0.0,
      isAddedToCarousel: false,
    );
  }

  CalefaccionState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
    double radAngle,
    bool isAddedToCarousel,

  }) {
    return CalefaccionState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueTemp: valueTemp ?? this.valueTemp,
      valueAngle: valueAngle ?? this.valueAngle,
      radAngle: radAngle ?? this.radAngle,
      isAddedToCarousel: isAddedToCarousel ?? this.isAddedToCarousel
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
        radAngle: 0.0,
        isEnabled: false,
        isAddedToCarousel: true,
      );
    }else if (event is UpdateCalefaccion){
      yield CalefaccionState(
        isEnabled: true, // (_lastAngle / 6.5)
        valueTemp:  getTemp(event.valueAngle), // getTemp(event.valueAngle)
        valueAngle: event.valueAngle,
        radAngle: event.radAngle,
        isAddedToCarousel: true,
      );
    } else if (event is AddedWWToCarousel) {
      yield CalefaccionState(
        isEnabled: true,
        valueTemp: 25,
        valueAngle: 0.0,
        radAngle: 0.0,
        isAddedToCarousel: event.isAdded,
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
