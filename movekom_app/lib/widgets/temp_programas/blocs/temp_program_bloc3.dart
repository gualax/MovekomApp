
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/widgets/temp_programas/temp_programa.dart';

abstract class TimerProgram3Event extends Equatable {
  TimerProgram3Event([List props = const []]) : super(props);
}

class Enable extends TimerProgram3Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends TimerProgram3Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends TimerProgram3Event { /// Deshabilita la bateria
  // final int valueTemp;
  final TimerProgram timerProgram;
  Update(this.timerProgram) : super([timerProgram]);

  @override
  String toString() => 'Update  {valueAngle: $timerProgram},}' ;
}

class Save extends TimerProgram3Event { /// Deshabilita la bateria
  // final int valueTemp;
  bool saved;
  Save(this.saved);
  @override
  String toString() => 'Update  {valueAngle:,}' ;
}
/// Fin declaracion de eventos



@immutable
abstract class TimerProgram3State {
  bool isEnabled;
  bool saved;
  TimerProgram timerProgram;
  TimerProgram3State({this.isEnabled, this.timerProgram,this.saved});
}

class InitialTimerProgramState extends TimerProgram3State {
  InitialTimerProgramState( {bool isEnabled, TimerProgram timerProgram,bool saved})
      : super(
    isEnabled: isEnabled ?? false,
    timerProgram: timerProgram ?? new TimerProgram(),
    saved: saved ?? false,

  );
}


class NewTimerProgramState extends TimerProgram3State {
  NewTimerProgramState.fromOldSettingState(TimerProgram3State oldState,
      {bool isEnabled, TimerProgram timerProgram, bool saved})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    timerProgram: timerProgram ?? oldState.timerProgram,
    saved : saved ?? oldState.saved,
  );
}

/// FIN  declaracion de STATE

class TimerProgram3Bloc extends Bloc <TimerProgram3Event, TimerProgram3State> {

  @override
  // TODO: implement initialState
  TimerProgram3State get initialState => InitialTimerProgramState();


  @override
  Stream<TimerProgram3State> mapEventToState(TimerProgram3Event event) async* {
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
