
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class LucesExteriorEvent extends Equatable {
  LucesExteriorEvent([List props = const []]) : super(props);
}

class Enable extends LucesExteriorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends LucesExteriorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateLucesExterior extends LucesExteriorEvent {  /// Habilita la bateria
  final double valueDimer;
  BuildContext _context;
  UpdateLucesExterior(this.valueDimer,this._context) : super([valueDimer,_context]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateLucesExteriorFromMode extends LucesExteriorEvent {  /// Habilita la bateria
  final double valueDimer;
  UpdateLucesExteriorFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class LucesExteriorState {
  final bool isEnabled;
  final double valueDimer;
  LucesExteriorState({this.isEnabled, this.valueDimer});
}

class InitialLucesExteriorState extends LucesExteriorState {
  InitialLucesExteriorState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewLucesExteriorState extends LucesExteriorState {
  NewLucesExteriorState.fromOldSettingState(LucesExteriorState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class LucesExteriorBloc extends Bloc <LucesExteriorEvent, LucesExteriorState> {

  @override
  // TODO: implement initialState
  LucesExteriorState get initialState => InitialLucesExteriorState();

  @override
  Stream<LucesExteriorState> mapEventToState(LucesExteriorEvent event) async* {
    if (event is Enable) {
      yield NewLucesExteriorState.fromOldSettingState(state,
          isEnabled: true);

    } else if (event is UpdateLucesExterior){
      disableModes(event._context);
      yield NewLucesExteriorState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    } else if (event is Disable) {
      yield NewLucesExteriorState.fromOldSettingState(state,
          isEnabled: false);
    }else if (event is UpdateLucesExteriorFromMode) {
      yield NewLucesExteriorState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }
}
