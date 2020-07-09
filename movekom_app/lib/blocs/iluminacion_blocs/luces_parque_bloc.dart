
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesExteriorEvent extends Equatable {
  LucesExteriorEvent([List props = const []]) : super(props);
}

class Enable extends LucesExteriorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesExteriorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesExteriorEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesExteriorState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesExteriorState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesExteriorState.initial() {
    return LucesExteriorState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesExteriorState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LucesExteriorState(
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

class LucesExteriorBloc extends Bloc <LucesExteriorEvent, LucesExteriorState> {

  @override
  // TODO: implement initialState
  LucesExteriorState get initialState => LucesExteriorState.initial();

  @override
  Stream<LucesExteriorState> mapEventToState(LucesExteriorEvent event) async* {
    if (event is Enable) {
      yield LucesExteriorState.initial();
    } else if (event is Update){
      yield LucesExteriorState(
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is Disable) {
      yield LucesExteriorState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
