import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/slider_controller.dart';

abstract class UplightEvent extends Equatable {
  UplightEvent([List props = const []]) : super(props);
}

class EnableUplight extends UplightEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableUplight extends UplightEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateUplight extends UplightEvent {  /// Habilita la bateria
  final double valueDimer;
  BuildContext _context;
  UpdateUplight(this.valueDimer,this._context) : super([valueDimer,_context]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class UpdateUplightFromMode extends UplightEvent {  /// Habilita la bateria
  final double valueDimer;
  UpdateUplightFromMode(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

@immutable
abstract class UplightState {
  final bool isEnabled;
  final double valueDimer;
  UplightState({this.isEnabled, this.valueDimer});
}

class InitialUplightState extends UplightState {
  InitialUplightState( {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? true,
    valueDimer: valueDimer ?? 0.0,
  );
}


class NewUplightState extends UplightState {
  NewUplightState.fromOldSettingState(UplightState oldState,
      {bool isEnabled, double valueDimer})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    valueDimer: valueDimer ?? oldState.valueDimer,
  );
}
/// FIN  declaracion de STATE

class UpligthBloc extends Bloc <UplightEvent, UplightState> {

  @override
  // TODO: implement initialState
  UplightState get initialState => InitialUplightState();

  @override
  Stream<UplightState> mapEventToState(UplightEvent event) async* {   
    if (event is EnableUplight) {
    yield NewUplightState.fromOldSettingState(state,
        isEnabled: true);

  } else if (event is UpdateUplight){
      disableModes(event._context);
      yield NewUplightState.fromOldSettingState(state,
      isEnabled: true,
      valueDimer: getValueUpdate(event.valueDimer),
    );
  } else if (event is DisableUplight) {
    yield NewUplightState.fromOldSettingState(state,
        isEnabled: false);
  } else if (event is UpdateUplightFromMode) {
      yield NewUplightState.fromOldSettingState(state,
        isEnabled: true,
        valueDimer: getValueUpdate(event.valueDimer),
      );
    }
  }
  
}
