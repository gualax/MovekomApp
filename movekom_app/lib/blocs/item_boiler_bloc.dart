
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ItemBoilerEvent extends Equatable {
  ItemBoilerEvent([List props = const []]) : super(props);
}

class Enable extends ItemBoilerEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends ItemBoilerEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ItemBoilerState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  ItemBoilerState({
    @required this.isEnabled,
    @required this.valueAmp,


  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory ItemBoilerState.initial() {
    return ItemBoilerState(
      isEnabled: false,
      valueAmp: 0,
    );
  }

  ItemBoilerState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ItemBoilerState(
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

class ItemBoilerBloc extends Bloc <ItemBoilerEvent, ItemBoilerState> {

  @override
  // TODO: implement initialState
  ItemBoilerState get initialState => ItemBoilerState.initial();

  @override
  Stream<ItemBoilerState> mapEventToState(ItemBoilerEvent event) async* {
    if (event is Enable) {
      yield ItemBoilerState(
        valueAmp: 0,
        isEnabled: true,
      );
    } else if (event is Disable) {
      yield ItemBoilerState.initial();
    }
  }
}
