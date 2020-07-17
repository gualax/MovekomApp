
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/widgets/temp_programas/temp_programa.dart';

abstract class TimerProgram5Event extends Equatable {
  TimerProgram5Event([List props = const []]) : super(props);
}

class Enable extends TimerProgram5Event {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends TimerProgram5Event { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends TimerProgram5Event { /// Deshabilita la bateria
  // final int valueTemp;
  final TimerProgram timerProgram;
  Update(this.timerProgram) : super([timerProgram]);

  @override
  String toString() => 'Update  {valueAngle: $timerProgram},}' ;
}

class Save extends TimerProgram5Event { /// Deshabilita la bateria
  // final int valueTemp;
  bool saved;
  Save(this.saved);
  @override
  String toString() => 'Update  {valueAngle:,}' ;
}
/// Fin declaracion de eventos



@immutable
abstract class TimerProgram5State {
  bool isEnabled;
  bool saved;
  TimerProgram timerProgram;
  TimerProgram5State({this.isEnabled, this.timerProgram,this.saved});
}

class InitialTimerProgramState extends TimerProgram5State {
  InitialTimerProgramState( {bool isEnabled, TimerProgram timerProgram,bool saved})
      : super(
    isEnabled: isEnabled ?? false,
    timerProgram: timerProgram ?? new TimerProgram(),
    saved: saved ?? false,

  );
}


class NewTimerProgramState extends TimerProgram5State {
  NewTimerProgramState.fromOldSettingState(TimerProgram5State oldState,
      {bool isEnabled, TimerProgram timerProgram, bool saved})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    timerProgram: timerProgram ?? oldState.timerProgram,
    saved : saved ?? oldState.saved,
  );
}

/// FIN  declaracion de STATE

class TimerProgram5Bloc extends Bloc <TimerProgram5Event, TimerProgram5State> {

  @override
  // TODO: implement initialState
  TimerProgram5State get initialState => InitialTimerProgramState();


  @override
  Stream<TimerProgram5State> mapEventToState(TimerProgram5Event event) async* {
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
