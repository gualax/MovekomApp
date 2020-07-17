
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/widgets/temp_programas/temp_programa.dart';

abstract class TimerProgramEvent extends Equatable {
  TimerProgramEvent([List props = const []]) : super(props);
}

class Enable extends TimerProgramEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends TimerProgramEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends TimerProgramEvent { /// Deshabilita la bateria
  // final int valueTemp;
  final TimerProgram timerProgram;
  Update(this.timerProgram) : super([timerProgram]);

  @override
  String toString() => 'Update  {valueAngle: $timerProgram},}' ;
}

class Save extends TimerProgramEvent { /// Deshabilita la bateria
  // final int valueTemp;
bool saved;
Save(this.saved);
  @override
  String toString() => 'Update  {valueAngle:,}' ;
}
/// Fin declaracion de eventos



@immutable
abstract class TimerProgramState {
  bool isEnabled;
  bool saved;
  TimerProgram timerProgram;
  TimerProgramState({this.isEnabled, this.timerProgram,this.saved});
}

class InitialTimerProgramState extends TimerProgramState {
  InitialTimerProgramState( {bool isEnabled, TimerProgram timerProgram,bool saved})
      : super(
    isEnabled: isEnabled ?? false,
    timerProgram: timerProgram ?? new TimerProgram(),
    saved: saved ?? false,

  );
}


class NewTimerProgramState extends TimerProgramState {
  NewTimerProgramState.fromOldSettingState(TimerProgramState oldState,
      {bool isEnabled, TimerProgram timerProgram, bool saved})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    timerProgram: timerProgram ?? oldState.timerProgram,
    saved : saved ?? oldState.saved,
  );
}

/// FIN  declaracion de STATE

class TimerProgramBloc extends Bloc <TimerProgramEvent, TimerProgramState> {

  @override
  // TODO: implement initialState
  TimerProgramState get initialState => InitialTimerProgramState();


  @override
  Stream<TimerProgramState> mapEventToState(TimerProgramEvent event) async* {
    if (event is Enable) {
      print("EnableTimerProgram");
      yield NewTimerProgramState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is Disable) {
      yield NewTimerProgramState.fromOldSettingState(state,
          isEnabled: false);
      print("DisableTimerProgram");
    } else if (event is Update) {
      yield NewTimerProgramState.fromOldSettingState(state,
          timerProgram: event.timerProgram);
    }else if (event is Save) {
      yield NewTimerProgramState.fromOldSettingState(state,
          saved: event.saved);
    }
  }
}
