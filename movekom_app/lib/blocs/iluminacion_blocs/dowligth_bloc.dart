import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DownLigthEvent extends Equatable {
  DownLigthEvent([List props = const []]) : super(props);
}

class Enable extends DownLigthEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends DownLigthEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class Update extends DownLigthEvent {  /// Habilita la bateria
  final double valueDimer;

  Update(this.valueDimer) : super([valueDimer]);

  @override
  String toString() => 'Update  {valueDimer: $valueDimer}}' ;
}

class DownligthState extends Equatable {
  final bool isEnabled;
  double valueDimer;

  DownligthState({
    @required this.isEnabled,
    @required this.valueDimer,

  }) : super([isEnabled,valueDimer]);

  /// Valores iniciales
  factory DownligthState.initial() {
    return DownligthState(
      isEnabled: true,
      valueDimer: 0.0,
    );
  }

  DownligthState copyWith({
    bool isEnabled,
    int valueDimer,
  }) {
    return DownligthState(
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

class DownligthBloc extends Bloc <DownLigthEvent, DownligthState> {

  @override
  // TODO: implement initialState
  DownligthState get initialState => DownligthState.initial();

  @override
  Stream<DownligthState> mapEventToState(DownLigthEvent event) async* {
    if (event is Enable) {
      yield DownligthState.initial();
    } else if (event is Update){

      yield DownligthState(
        isEnabled: true,
        valueDimer: event.valueDimer,
      );

    } else if (event is Disable) {
      yield DownligthState(
        valueDimer: 0.0,
        isEnabled: false,
      );
    }
  }
}
