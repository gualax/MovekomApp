
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesBanoEvent extends Equatable {
  LucesBanoEvent([List props = const []]) : super(props);
}

class EnableLucesBano extends LucesBanoEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableLucesBano extends LucesBanoEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateLucesBano extends LucesBanoEvent {  /// Habilita la bateria
  final double valueDimer;
  BuildContext _context;
  UpdateLucesBano(this.valueDimer,this._context) : super([valueDimer,_context]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateBanoFromMode extends LucesBanoEvent {  /// Habilita la bateria
  final double valueDimer;

  UpdateBanoFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class LucesBanoState {
  final bool isEnabled;
  final double valueDimer;
  LucesBanoState({this.isEnabled, this.valueDimer});
}

class InitialLucesBanoState extends LucesBanoState {
  InitialLucesBanoState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewLucesBanoState extends LucesBanoState {
  NewLucesBanoState.fromOldSettingState(LucesBanoState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class LucesBanoBloc extends Bloc <LucesBanoEvent, LucesBanoState> {

  @override
  // TODO: implement initialState
  LucesBanoState get initialState => InitialLucesBanoState();

  @override
  Stream<LucesBanoState> mapEventToState(LucesBanoEvent event) async* {
    if (event is EnableLucesBano) {
      yield NewLucesBanoState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is UpdateLucesBano) {
      disableModes(event._context);
      yield NewLucesBanoState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is DisableLucesBano) {
      yield NewLucesBanoState.fromOldSettingState(state,
          isEnabled: false);
    } else if (event is UpdateBanoFromMode) {

      yield NewLucesBanoState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }
}
