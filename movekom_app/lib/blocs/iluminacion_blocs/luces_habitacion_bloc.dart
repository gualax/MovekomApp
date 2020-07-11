
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesHabitacionEvent extends Equatable {
  LucesHabitacionEvent([List props = const []]) : super(props);
}

class EnableLucesHabitacion extends LucesHabitacionEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableLucesHabitacion extends LucesHabitacionEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateLucesHabitacion extends LucesHabitacionEvent {  /// Habilita la bateria
 final double valueDimer;
 BuildContext _context;
 UpdateLucesHabitacion(this.valueDimer,this._context) : super([valueDimer,_context]);

 @override
 String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateLucesHabitacionFromMode extends LucesHabitacionEvent {  /// Habilita la bateria
  final double valueDimer;
  UpdateLucesHabitacionFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class LucesHabitacionState {
  final bool isEnabled;
  final double valueDimer;
  LucesHabitacionState({this.isEnabled, this.valueDimer});
}

class InitialLucesHabitacionState extends LucesHabitacionState {
  InitialLucesHabitacionState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewLucesHabitacionState extends LucesHabitacionState {
  NewLucesHabitacionState.fromOldSettingState(LucesHabitacionState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class LucesHabitacionBloc extends Bloc <LucesHabitacionEvent, LucesHabitacionState> {

  @override
  // TODO: implement initialState
  LucesHabitacionState get initialState => InitialLucesHabitacionState();

  @override
  Stream<LucesHabitacionState> mapEventToState(LucesHabitacionEvent event) async* {
    if (event is EnableLucesHabitacion) {
      yield NewLucesHabitacionState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is UpdateLucesHabitacion) {
      disableModes(event._context);
      yield NewLucesHabitacionState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is DisableLucesHabitacion) {
      yield NewLucesHabitacionState.fromOldSettingState(state,
          isEnabled: false);
    }else if (event is UpdateLucesHabitacionFromMode) {
      yield NewLucesHabitacionState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }

}

