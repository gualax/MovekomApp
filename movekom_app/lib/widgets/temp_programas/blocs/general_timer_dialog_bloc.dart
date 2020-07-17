
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class GeneralTimerProgramEvent extends Equatable {
  GeneralTimerProgramEvent([List props = const []]) : super(props);
}


class UpdateGeneral extends GeneralTimerProgramEvent { /// Deshabilita la bateria
  // final int valueTemp;
  int numberWidget;
  UpdateGeneral(this.numberWidget) : super([numberWidget]);

  @override
  String toString() => 'Update  {valueAngle: $numberWidget},}' ;
}


/// Fin declaracion de eventos



@immutable
abstract class GeneralTimerProgramState {
  int numberWidget;
  GeneralTimerProgramState({this.numberWidget});
}

class InitialTimerProgramState extends GeneralTimerProgramState {
  InitialTimerProgramState( {int numberWidget})
      : super(
    numberWidget: numberWidget ?? 0,
  );
}


class NewGeneralProgramState extends GeneralTimerProgramState {
  NewGeneralProgramState.fromOldSettingState(GeneralTimerProgramState oldState,
      {int numberWidget})
      : super(
    numberWidget: numberWidget ?? oldState.numberWidget,
  );
}

/// FIN  declaracion de STATE

class GeneralTimerProgramBloc extends Bloc <GeneralTimerProgramEvent, GeneralTimerProgramState> {

  @override
  // TODO: implement initialState
  GeneralTimerProgramState get initialState => InitialTimerProgramState();


  @override
  Stream<GeneralTimerProgramState> mapEventToState(
      GeneralTimerProgramEvent event) async* {
    if (event is UpdateGeneral) {
      yield NewGeneralProgramState.fromOldSettingState(state,
          numberWidget: event.numberWidget);
    }
  }
}
