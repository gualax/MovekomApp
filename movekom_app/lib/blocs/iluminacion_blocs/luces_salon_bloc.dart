
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesSalonEvent extends Equatable {
  LucesSalonEvent([List props = const []]) : super(props);
}

class EnableLucesSalon extends LucesSalonEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableLucesSalon extends LucesSalonEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateLucesSalon extends LucesSalonEvent {  /// Habilita la bateria
  final double valueDimer;
  BuildContext _context;
  UpdateLucesSalon(this.valueDimer,this._context) : super([valueDimer,_context]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateLucesSalonFromMode extends LucesSalonEvent {  /// Habilita la bateria
  final double valueDimer;
  UpdateLucesSalonFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class LucesSalonState {
  final bool isEnabled;
  final double valueDimer;
  LucesSalonState({this.isEnabled, this.valueDimer});
}

class InitialLucesSalonState extends LucesSalonState {
  InitialLucesSalonState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewLucesSalonState extends LucesSalonState {
  NewLucesSalonState.fromOldSettingState(LucesSalonState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class LucesSalonBloc extends Bloc <LucesSalonEvent, LucesSalonState> {

  @override
  // TODO: implement initialState
  LucesSalonState get initialState => InitialLucesSalonState();

  @override
  Stream<LucesSalonState> mapEventToState(LucesSalonEvent event) async* {
    if (event is EnableLucesSalon) {
      yield NewLucesSalonState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is UpdateLucesSalon){
      disableModes(event._context);
      yield NewLucesSalonState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is DisableLucesSalon) {
      yield NewLucesSalonState.fromOldSettingState(state,
          isEnabled: false);
    }else if (event is UpdateLucesSalonFromMode) {
      yield NewLucesSalonState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }
}
