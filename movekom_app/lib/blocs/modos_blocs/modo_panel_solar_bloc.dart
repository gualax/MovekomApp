
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ModoPanelSolarEvent extends Equatable {
  ModoPanelSolarEvent([List props = const []]) : super(props);
}

class Enable extends ModoPanelSolarEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableModoPanel';
}


class AddToList extends ModoPanelSolarEvent {  /// Habilita la bateria
  @override
  String toString() => 'AddToList';
}

class Disable extends ModoPanelSolarEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableModoPanel';
}
/// Fin declaracion de eventos


@immutable
abstract class ModoPanelSolarState {
  final bool isEnabled;
  final bool isAddedToList;
  ModoPanelSolarState({this.isEnabled, this.isAddedToList});
}

class InitialModoPanelSolarState extends ModoPanelSolarState {
  InitialModoPanelSolarState()
      : super(
      isEnabled: false,
      isAddedToList: false);
}

class NewModoPanelSolarState extends ModoPanelSolarState {
  NewModoPanelSolarState.fromOldSettingState(ModoPanelSolarState oldState,
      {bool isEnabled, bool isAddedToList})
      : super(
    isEnabled: isEnabled ?? oldState.isEnabled,
    isAddedToList: isAddedToList ?? oldState.isAddedToList,
  );
}

/*
 
class ModoPanelSolarState extends Equatable {
  final bool isEnabled;

  ModoPanelSolarState({
    @required this.isEnabled,
  }) : super([isEnabled]);

  /// Valores iniciales
  factory ModoPanelSolarState.initial() {
    return ModoPanelSolarState(
      isEnabled: false,
    );
  }

  ModoPanelSolarState copyWith({
    bool isEnabled,
  }) {
    return ModoPanelSolarState(
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled }';
  }
}
/// FIN  declaracion de STATE


 */
class ModoPanelSolarBloc extends Bloc <ModoPanelSolarEvent, ModoPanelSolarState> {

  @override
  ModoPanelSolarState get initialState => InitialModoPanelSolarState();

  @override
  Stream<ModoPanelSolarState> mapEventToState(ModoPanelSolarEvent event) async* {

    if (event is Enable) {
      print(state);
    yield NewModoPanelSolarState.fromOldSettingState(state,
          isEnabled: true);
    } else if (event is Disable){
      print(state);
      yield NewModoPanelSolarState.fromOldSettingState(state,
          isEnabled: false);
    } else if (event is AddToList){
      print(state);
      yield NewModoPanelSolarState.fromOldSettingState(state,
          isAddedToList: true);
    }

  }
}
