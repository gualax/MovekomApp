
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesSalonEvent extends Equatable {
  LucesSalonEvent([List props = const []]) : super(props);
}

class Enable extends LucesSalonEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesSalonEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesSalonEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesSalonState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesSalonState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesSalonState.initial() {
    return LucesSalonState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesSalonState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LucesSalonState(
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

class LucesSalonBloc extends Bloc <LucesSalonEvent, LucesSalonState> {

  @override
  // TODO: implement initialState
  LucesSalonState get initialState => LucesSalonState.initial();

  @override
  Stream<LucesSalonState> mapEventToState(LucesSalonEvent event) async* {
    if (event is Enable) {
      yield LucesSalonState.initial();
    } else if (event is Update){

      yield LucesSalonState(
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );

    } else if (event is Disable) {
      yield LucesSalonState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
