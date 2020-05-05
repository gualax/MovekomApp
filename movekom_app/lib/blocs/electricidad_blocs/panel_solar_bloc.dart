
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PanelSolarEvent extends Equatable {
  PanelSolarEvent([List props = const []]) : super(props);
}

class EnablePanelSolar extends PanelSolarEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisablePanelSolar extends PanelSolarEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class PanelSolarState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  PanelSolarState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory PanelSolarState.initial() {
    return PanelSolarState(
      isEnabled: true,
      valueAmp: 50,
    );
  }

  PanelSolarState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return PanelSolarState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueAmp: valueAmp ?? this.valueAmp,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueAmp }';
  }
}
/// FIN  declaracion de STATE

class PanelSolarBloc extends Bloc <PanelSolarEvent, PanelSolarState> {

  @override
  // TODO: implement initialState
  PanelSolarState get initialState => PanelSolarState.initial();

  @override
  Stream<PanelSolarState> mapEventToState(PanelSolarEvent event) async* {
    if (event is EnablePanelSolar) {
      yield PanelSolarState.initial();
    } else if (event is DisablePanelSolar) {
      yield PanelSolarState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }
}
