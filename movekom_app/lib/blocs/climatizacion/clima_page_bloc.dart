import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ClimaPageEvent extends Equatable {
  ClimaPageEvent([List props = const []]) : super(props);
}


class UpdateTab extends ClimaPageEvent { /// Deshabilita la bateria
  final int index;
  UpdateTab(this.index) : super([index]);

  @override
  String toString() => 'Update  {valueAngle: $index}}' ;
}
/// Fin declaracion de eventos


class ClimaPageState extends Equatable {
  int index;

  ClimaPageState({
    @required this.index,
  }) : super([index]);

  /// Valores iniciales
  factory ClimaPageState.initial() {
    return ClimaPageState(
      index: 0,
    );
  }

  ClimaPageState copyWith({
    int index,
  }) {
    return ClimaPageState(
      index: index ?? this.index,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { index: $index }';
  }
}
/// FIN  declaracion de STATE

class ClimaPageBloc extends Bloc <ClimaPageEvent, ClimaPageState> {

  @override
  // TODO: implement initialState
  ClimaPageState get initialState => ClimaPageState.initial();


  @override
  Stream<ClimaPageState> mapEventToState(ClimaPageEvent event) async* {
    if (event is UpdateTab){
      yield ClimaPageState(
        index: event.index,
      );
    }
  }
}
