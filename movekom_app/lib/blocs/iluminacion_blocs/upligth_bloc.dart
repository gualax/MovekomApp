import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class UplightEvent extends Equatable {
  UplightEvent([List props = const []]) : super(props);
}

class Enable extends UplightEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends UplightEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends UplightEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UplightState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  UplightState.UpligthState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory UplightState.initial() {
    return UplightState.UpligthState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  UplightState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return UplightState.UpligthState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueDimer: valueDimer ?? this.valueDimer,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueDimer }';
  }
}
/// FIN  declaracion de STATE

class UpligthBloc extends Bloc <UplightEvent, UplightState> {

  @override
  // TODO: implement initialState
  UplightState get initialState => UplightState.initial();

  @override
  Stream<UplightState> mapEventToState(UplightEvent event) async* {
    if (event is Enable) {
      yield UplightState.initial();
    } else if (event is Update){

      yield UplightState.UpligthState(
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );

    } else if (event is Disable) {
      yield UplightState.UpligthState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
