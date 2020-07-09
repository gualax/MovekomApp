
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesCocinaEvent extends Equatable {
  LucesCocinaEvent([List props = const []]) : super(props);
}

class Enable extends LucesCocinaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesCocinaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesCocinaEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesCocinaState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesCocinaState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesCocinaState.initial() {
    return LucesCocinaState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesCocinaState copyWith({
    bool isEnabled,
    double valueDimer,
  }) {
    return LucesCocinaState(
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

class LucesCocinaBloc extends Bloc <LucesCocinaEvent, LucesCocinaState> {

  @override
  // TODO: implement initialState
  LucesCocinaState get initialState => LucesCocinaState.initial();

  @override
  Stream<LucesCocinaState> mapEventToState(LucesCocinaEvent event) async* {
    if (event is Enable) {
      yield LucesCocinaState.initial();

    } else if (event is Update){
      yield LucesCocinaState(
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is Disable) {
      yield LucesCocinaState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}

