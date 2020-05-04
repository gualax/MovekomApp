
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LucesHabitacionEvent extends Equatable {
  LucesHabitacionEvent([List props = const []]) : super(props);
}

class Enable extends LucesHabitacionEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesHabitacionEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends LucesHabitacionEvent {  /// Habilita la bateria
 final double valueDimer;

 Update(this.valueDimer) : super([valueDimer]);

 @override
 String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class LucesHabitacionState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesHabitacionState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesHabitacionState.initial() {
    return LucesHabitacionState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesHabitacionState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return LucesHabitacionState(
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

class LucesHabitacionBloc extends Bloc <LucesHabitacionEvent, LucesHabitacionState> {

  @override
  // TODO: implement initialState
  LucesHabitacionState get initialState => LucesHabitacionState.initial();

  @override
  Stream<LucesHabitacionState> mapEventToState(LucesHabitacionEvent event) async* {
    if (event is Enable) {
      yield LucesHabitacionState.initial();
    } else if (event is Update){

      yield LucesHabitacionState(
        isEnabled: true,
        valueDimer: event.valueDimer,
      );

    } else if (event is Disable) {
      yield LucesHabitacionState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
