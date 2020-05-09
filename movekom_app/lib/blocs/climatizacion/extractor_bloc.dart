
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ExtractorEvent extends Equatable {
  ExtractorEvent([List props = const []]) : super(props);
}

class EnableExtractor extends ExtractorEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableExtractor extends ExtractorEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}

class UpdateExtractor extends ExtractorEvent { /// Deshabilita la bateria
  // final int valueTemp;
  final double valueAngle;
  final double radAngle;
  UpdateExtractor(this.valueAngle,this.radAngle) : super([valueAngle,radAngle]);

  @override
  String toString() => 'Update  {valueAngle: $valueAngle},{radAngle: $radAngle}}' ;
}
/// Fin declaracion de eventos


class ExtractorState extends Equatable {
  final bool isEnabled;
  double valueAngle;
  double radAngle;
  int valueExt;

  ExtractorState({
    @required this.isEnabled,
    @required this.valueExt,
    @required this.valueAngle,
    @required this.radAngle,


  }) : super([isEnabled,valueExt,valueAngle]);

  /// Valores iniciales
  factory ExtractorState.initial() {
    return ExtractorState(
      isEnabled: true,
      valueExt: 25,
      valueAngle: 0.0,
      radAngle: 0.0,
    );
  }

  ExtractorState copyWith({
    bool isEnabled,
    int valueAmp,
    double valueAngle,
    double radAngle,
  }) {
    return ExtractorState(
      isEnabled: isEnabled ?? this.isEnabled,
      valueExt: valueExt ?? this.valueExt,
      valueAngle: valueAngle ?? this.valueAngle,
      radAngle: radAngle ?? this.radAngle,
    );
  }
  @override
  String toString() {
    return 'StopwatchState { isEnabled: $isEnabled, isInitial: $valueExt }';
  }
}
/// FIN  declaracion de STATE

class ExtractorBloc extends Bloc <ExtractorEvent, ExtractorState> {



  @override
  // TODO: implement initialState
  ExtractorState get initialState => ExtractorState.initial();


  @override
  Stream<ExtractorState> mapEventToState(ExtractorEvent event) async* {
    if (event is EnableExtractor) {
      yield ExtractorState.initial();
    } else if (event is DisableExtractor) {
      yield ExtractorState(
        valueExt: 0,
        valueAngle: 0.0,
        radAngle: 0.0,
        isEnabled: false,
      );
    }else if (event is UpdateExtractor){
      yield ExtractorState(
        isEnabled: true, // (_lastAngle / 6.5)
        valueExt: 25 + (event.valueAngle / 5.5).round(),
        valueAngle: event.valueAngle,
        radAngle: event.radAngle,
      );
    }
  }
}
