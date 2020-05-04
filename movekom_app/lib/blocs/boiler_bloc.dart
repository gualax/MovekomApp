
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BoilerEvent extends Equatable {
  BoilerEvent([List props = const []]) : super(props);
}

class Enable extends BoilerEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Update extends BoilerEvent {  /// Habilita la bateria
  final double valueCord;

  Update(this.valueCord) : super([valueCord]);

  @override
  String toString() => 'Update  {valueCord: $valueCord}}' ;
}

class BoilerState extends Equatable {
  final bool isEnabled;
  double valueCord;

  BoilerState({
    @required this.isEnabled,
    @required this.valueCord,

  }) : super([isEnabled,valueCord]);

  /// Valores iniciales
  factory BoilerState.initial() {
    return BoilerState(
      isEnabled: true,
      valueCord: 1,
    );
  }

  BoilerState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return BoilerState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueCord: valueDimer ?? this.valueCord,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueCord }';
  }
}
/// FIN  declaracion de STATE

class BoilerBloc extends Bloc <BoilerEvent, BoilerState> {

  @override
  // TODO: implement initialState
  BoilerState get initialState => BoilerState.initial();

  @override
  Stream<BoilerState> mapEventToState(BoilerEvent event) async* {
    if (event is Enable) {
      yield BoilerState.initial();
    } else if (event is Update){

      yield BoilerState(
        isEnabled: true,
        valueCord: event.valueCord,
      );
    }
  }
}
