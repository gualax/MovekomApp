
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/widgets/temp_programas/temp_programa.dart';

abstract class TimerProgramListEvent extends Equatable {
  TimerProgramListEvent([List props = const []]) : super(props);
}

class Add extends TimerProgramListEvent {  /// Habilita la bateria
  TimerProgram tp;
  Add(this.tp);
  @override
  String toString() => 'EnableBatery';
}

class Remove extends TimerProgramListEvent { /// Deshabilita la bateria
  TimerProgram tp;
  Remove(this.tp);
  @override
  String toString() => 'DisableBatery';
}


/// Fin declaracion de eventos



@immutable
abstract class TimerProgramListState {
  List<TimerProgram> tpList ;
  TimerProgramListState({this.tpList,});
}

class InitialTimerProgramState extends TimerProgramListState {
  InitialTimerProgramState( {List<TimerProgram> tpList})
      : super(
    tpList: tpList ?? List(),
  );
}


class NewTimerProgramState extends TimerProgramListState {
  NewTimerProgramState.fromOldSettingState(TimerProgramListState oldState,
      {List<TimerProgram> tpList})
      : super(
    tpList: tpList ?? oldState.tpList,
  );
}


/// FIN  declaracion de STATE



class TimerProgramBloc extends Bloc <TimerProgramListEvent, TimerProgramListState> {



  @override
  // TODO: implement initialState
  TimerProgramListState get initialState => InitialTimerProgramState();


  @override
  Stream<TimerProgramListState> mapEventToState(TimerProgramListEvent event) async* {
    if (event is Add) {
      yield NewTimerProgramState.fromOldSettingState(state,
          tpList: adedToList(state.tpList,event.tp) );
    } else if (event is Remove) {
      yield NewTimerProgramState.fromOldSettingState(state,
          tpList: removeFromList(state.tpList,event.tp));
    }
    }

    List<TimerProgram> adedToList(list,item) {
      final List<TimerProgram> weatherList = list;
      weatherList.add(item);
      return weatherList;
    }

    List<TimerProgram> removeFromList(list,item) {
      final List<TimerProgram> weatherList = list;
      weatherList.remove(item);
      return weatherList;
    }
}
