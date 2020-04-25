

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BateriaMotorEvent extends Equatable {
  BateriaMotorEvent([List props = const []]): super(props);

}

class InitialBateriaMotor extends BateriaMotorEvent {
  @override
  String toString() => 'InitialBateriaMotor';

  @override
  List<Object> get props => null;
}

class DisableBateriaMotor extends BateriaMotorEvent {
  @override
  String toString() => 'DisableBateriaMotor';
  @override
  List<Object> get props => null;
}

class EnableBateriaMotor extends BateriaMotorEvent {
  @override
  String toString() => 'EnableBateriaMotor';

  @override
  List<Object> get props => null;
}

class UpdateBateriaMotor extends BateriaMotorEvent {
  final double _valueBat;

  UpdateBateriaMotor(this._valueBat) : super([_valueBat]);

  @override
  String toString() =>
      'UpdateStopwatch {timeInMilliseconds: ${_valueBat}}';

}  /// FIN BateriaMotorEvent

class BateriaMotorState extends Equatable {
  final double valueBat;
  final bool isInitial;
  final bool isEnabled;

  BateriaMotorState({
    @required this.valueBat,
    @required this.isInitial,
    @required this.isEnabled,
  }) : super([valueBat, isInitial, isEnabled]);

  factory BateriaMotorState.initial() {
    return BateriaMotorState(
      isInitial: true,
      isEnabled: true,
      valueBat: 0.0,
    );
  }


  BateriaMotorState copyWith({
     double valueBat,
     bool isInitial,
     bool isEnabled,

  }) {
    return BateriaMotorState(
      valueBat: valueBat ?? this.valueBat,
      isInitial: isInitial ?? this.isInitial,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  String toString() {
    return 'StopwatchState { valueBat: $valueBat, isInitial: $isInitial, isEnabled: $isEnabled }';
  }
}  /// FIN BateriaMotorState

class BateriaMotorBloc extends Bloc<BateriaMotorEvent, BateriaMotorState> {
  double _valueBat = 0.0;

  StreamSubscription _streamPeriodicSubscription;

  @override
  void dispose() {
    _streamPeriodicSubscription?.cancel();
    _streamPeriodicSubscription = null;
    super.dispose();
  }

  @override
  BateriaMotorState get initialState => BateriaMotorState.initial();

  @override
  Stream<BateriaMotorState> mapEventToState(BateriaMotorEvent event) async* {
    if (event is InitialBateriaMotor) {
      if (_streamPeriodicSubscription == null) {
        _streamPeriodicSubscription =
            Stream.periodic(Duration(milliseconds: 10)).listen(
                  (_) {
                    _valueBat += 0.1;
                    dispatch(
                      UpdateBateriaMotor(_valueBat),
                    );
                  });
              };
    } else if (event is UpdateBateriaMotor) {
     // final bool isSpecial = event.time.inMilliseconds % 3000 == 0;
      yield BateriaMotorState(
        valueBat: event._valueBat,
        isInitial: false,
        isEnabled: true,
      );
    } else if (event is DisableBateriaMotor) {
      _streamPeriodicSubscription?.cancel();
      _streamPeriodicSubscription = null;
      yield currentState.copyWith(isEnabled: false);

    } else if (event is EnableBateriaMotor) {
      if (!currentState.isEnabled) {
        yield BateriaMotorState.initial();
      }
    }
  }
}
