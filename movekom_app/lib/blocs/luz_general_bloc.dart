
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LuzGeneralEvent extends Equatable {
  LuzGeneralEvent([List props = const []]) : super(props);
}

class Enable extends LuzGeneralEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LuzGeneralEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LuzGeneralEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LuzGeneralState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LuzGeneralState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LuzGeneralState.initial() {
    return LuzGeneralState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LuzGeneralState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LuzGeneralState(
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

class LuzGeneralBloc extends Bloc <LuzGeneralEvent, LuzGeneralState> {

  @override
  // TODO: implement initialState
  LuzGeneralState get initialState => LuzGeneralState.initial();

  @override
  Stream<LuzGeneralState> mapEventToState(LuzGeneralEvent event) async* {
    if (event is Enable) {
      yield LuzGeneralState.initial();
    } else if (event is Update){

      yield LuzGeneralState(
        isEnabled: true,
        valueDimer: event.valueDimer,
      );

    } else if (event is Disable) {
      yield LuzGeneralState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
