
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/slider_controller.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode1_bloc.dart';

abstract class LucesCocinaEvent extends Equatable {
  LucesCocinaEvent([List props = const []]) : super(props);
}

class EnableCocina extends LucesCocinaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableCocina extends LucesCocinaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateLucesCocina extends LucesCocinaEvent {  /// Habilita la bateria
  final double valueDimer;
  BuildContext _context;
  UpdateLucesCocina(this.valueDimer,this._context) : super([valueDimer,_context]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateCocinaFromMode extends LucesCocinaEvent {  /// Habilita la bateria
  final double valueDimer;
  UpdateCocinaFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class LucesCocinaState {
  final bool isEnabled;
  final double valueDimer;
  LucesCocinaState({this.isEnabled, this.valueDimer});
}

class InitialLucesCocinaState extends LucesCocinaState {
  InitialLucesCocinaState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewLucesCocinaState extends LucesCocinaState {
  NewLucesCocinaState.fromOldSettingState(LucesCocinaState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}




/*

class LucesCocinaState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  LucesCocinaState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory LucesCocinaState.initial() {
    return LucesCocinaState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  LucesCocinaState copyWith({
    bool isEnabled,
    double valueDimer,
  }) {
    return LucesCocinaState(
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


 */
class LucesCocinaBloc extends Bloc <LucesCocinaEvent, LucesCocinaState> {

  @override
  // TODO: implement initialState
  LucesCocinaState get initialState => InitialLucesCocinaState();

  @override
  Stream<LucesCocinaState> mapEventToState(LucesCocinaEvent event) async* {
    if (event is EnableCocina) {
      yield NewLucesCocinaState.fromOldSettingState(state,
          isEnabled: true);

    } else if (event is UpdateLucesCocina){
      disableModes(event._context);
      yield NewLucesCocinaState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is DisableCocina) {
      yield NewLucesCocinaState.fromOldSettingState(state,
        isEnabled: false);
    } else if (event is UpdateCocinaFromMode) {
      yield NewLucesCocinaState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }
}

