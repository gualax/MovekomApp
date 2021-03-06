
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/MapeoIDs/IdComponents.dart';
import 'package:movekomapp/bluetooth/BluetoothRepository.dart';

abstract class ConsumosEvent extends Equatable {
  ConsumosEvent([List props = const []]) : super(props);
}

class EnableInversor extends ConsumosEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class DisableInversor extends ConsumosEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class ConsumosState extends Equatable {
  final bool isEnabled;
  int valueAmp;

  ConsumosState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory ConsumosState.initial() {
    return ConsumosState(
      isEnabled: true,
      valueAmp: 50,
    );
  }

  ConsumosState copyWith({
    bool isEnabled,
    int valueAmp,
  }) {
    return ConsumosState(
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

class ConsumosBloc extends Bloc <ConsumosEvent, ConsumosState> {
  var ID = IdComponent.CONSUMOS;



  @override
  // TODO: implement initialState
  ConsumosState get initialState => ConsumosState.initial();


  @override
  Stream<ConsumosState> mapEventToState(ConsumosEvent event) async* {
    if (event is EnableInversor) {
      yield* _setInitValuesAndSendBT(event);
    } else if (event is DisableInversor) {
      yield ConsumosState(
        valueAmp: 0,
        isEnabled: false,
      );
    }
  }


  Stream<ConsumosState> _setInitValuesAndSendBT(ConsumosEvent event) async* {
    print("_setInitValuesAndSendBT");
    List<int> elems = new List<int>();
    elems.add(ID);
    elems.add(0x33);
    try {
      BluetoothRepository.sendData(elems);
      yield ConsumosState.initial();
    } catch(e) {
      print(e);
    }
  }
}
