
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BluetoothControllerEvent extends Equatable {
  BluetoothControllerEvent([List props = const []]) : super(props);
}

class Enable extends BluetoothControllerEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends BluetoothControllerEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Start extends BluetoothControllerEvent { /// Deshabilita la bateria
  final bool value;

  Start(this.value) : super([value]);
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class BluetoothControllerState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  BluetoothControllerState({
    @required this.isEnabled,

  }) : super([isEnabled]);

  /// Valores iniciales
  factory BluetoothControllerState.initial() {
    return BluetoothControllerState(
      isEnabled: false,
    );
  }

  BluetoothControllerState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return BluetoothControllerState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueAmp }';
  }
}
/// FIN  declaracion de STATE

class BluetoothControllerBloc extends Bloc <BluetoothControllerEvent, BluetoothControllerState> {



  @override
  // TODO: implement initialState
  BluetoothControllerState get initialState => BluetoothControllerState.initial();


  @override
  Stream<BluetoothControllerState> mapEventToState(BluetoothControllerEvent event) async* {
    if (event is Enable) {
      yield BluetoothControllerState.initial();
    } else if (event is Disable) {
      yield BluetoothControllerState(
        isEnabled: false,
      );
    } else if(event is Start){
      yield BluetoothControllerState(
        isEnabled: event.value,
      );
    }
  }
}
