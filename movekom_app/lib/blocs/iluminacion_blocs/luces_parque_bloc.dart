
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LucesParqueEvent extends Equatable {
  LucesParqueEvent([List props = const []]) : super(props);
}

class Enable extends LucesParqueEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesParqueEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesParqueEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesParqueState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesParqueState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesParqueState.initial() {
    return LucesParqueState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesParqueState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LucesParqueState(
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

class LucesParqueBloc extends Bloc <LucesParqueEvent, LucesParqueState> {

  @override
  // TODO: implement initialState
  LucesParqueState get initialState => LucesParqueState.initial();

  @override
  Stream<LucesParqueState> mapEventToState(LucesParqueEvent event) async* {
    if (event is Enable) {
      yield LucesParqueState.initial();
    } else if (event is Update){

      yield LucesParqueState(
        isEnabled: true,
        valueDimer: event.valueDimer,
      );

    } else if (event is Disable) {
      yield LucesParqueState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
