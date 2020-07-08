
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

abstract class ListRebuildEvent extends Equatable {
  ListRebuildEvent([List props = const []]) : super(props);
}


class Rebuild extends ListRebuildEvent {  /// Habilita la bateria
   static var rng = new Random();
   double valueDimer = rng.nextDouble();


  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class ListRebuildState extends Equatable {
  double valueDimer;

  ListRebuildState({
    @required this.valueDimer,

  }) : super([valueDimer]);

  /// Valores iniciales
  factory ListRebuildState.initial() {
    return ListRebuildState(
      valueDimer: 0.0,
    );
  }

  ListRebuildState copyWith({
    int valueDimer,
  }) {
    return ListRebuildState(
      valueDimer: valueDimer ?? this.valueDimer,
    );
  }

  @override
  String toString() {
    return 'StopwatchState { isEnabled:, isInitial: $valueDimer }';
  }
}
/// FIN  declaracion de STATE

class ListRebuildBloc extends Bloc <ListRebuildEvent, ListRebuildState> {

  @override
  // TODO: implement initialState
  ListRebuildState get initialState => ListRebuildState.initial();

  @override
  Stream<ListRebuildState> mapEventToState(ListRebuildEvent event) async* {
    if (event is Rebuild){
      yield ListRebuildState(
        valueDimer: event.valueDimer,
      );
    }
  }
}
