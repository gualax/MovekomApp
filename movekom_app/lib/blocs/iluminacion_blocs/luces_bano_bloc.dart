
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesBanoEvent extends Equatable {
  LucesBanoEvent([List props = const []]) : super(props);
}

class Enable extends LucesBanoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesBanoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesBanoEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesBanoState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesBanoState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesBanoState.initial() {
    return LucesBanoState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesBanoState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LucesBanoState(
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

class LucesBanoBloc extends Bloc <LucesBanoEvent, LucesBanoState> {

  @override
  // TODO: implement initialState
  LucesBanoState get initialState => LucesBanoState.initial();

  @override
  Stream<LucesBanoState> mapEventToState(LucesBanoEvent event) async* {
    if (event is Enable) {
      yield LucesBanoState.initial();
    } else if (event is Update){

      yield LucesBanoState(
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );

    } else if (event is Disable) {
      yield LucesBanoState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
