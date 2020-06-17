
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TabEvent extends Equatable {
  TabEvent([List props = const []]) : super(props);
}


class UpdateTab extends TabEvent { /// Deshabilita la bateria
  final int index;
  UpdateTab(this.index) : super([index]);

  @override
  String toString() => 'Update  {valueAngle: $index}}' ;
}
/// Fin declaracion de eventos


class TabState extends Equatable {
  int index;

  TabState({
    @required this.index,
  }) : super([index]);

  /// Valores iniciales
  factory TabState.initial() {
    return TabState(
      index: 0,
    );
  }

  TabState copyWith({
    int index,
  }) {
    return TabState(
      index: index ?? this.index,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { index: $index }';
  }
}
/// FIN  declaracion de STATE

class TabBloc extends Bloc <TabEvent, TabState> {

  @override
  // TODO: implement initialState
  TabState get initialState => TabState.initial();


  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
   if (event is UpdateTab){
      yield TabState(
        index: event.index,
      );
    }
  }
}
