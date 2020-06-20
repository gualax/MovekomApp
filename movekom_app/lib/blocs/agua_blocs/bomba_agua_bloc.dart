
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/MapeoIDs/IdComponents.dart';
import 'package:movekomapp/bluetooth/BluetoothRepository.dart';

abstract class BombaAguaEvent extends Equatable {
  BombaAguaEvent([List props = const []]) : super(props);
}

class Enable extends BombaAguaEvent {  /// Habilita la bateria
  @override
  String toString() => 'EnableBatery';
}

class Disable extends BombaAguaEvent { /// Deshabilita la bateria
  @override
  String toString() => 'DisableBatery';
}
/// Fin declaracion de eventos


class BombaAguaState extends Equatable {
  final bool isEnabled;
  double valueAmp;

  BombaAguaState({
    @required this.isEnabled,
    @required this.valueAmp,

  }) : super([isEnabled,valueAmp]);

  /// Valores iniciales
  factory BombaAguaState.initial() {
    return BombaAguaState(
      isEnabled: true,
      valueAmp: 2.65,
    );
  }

  BombaAguaState copyWith({
    bool isEnabled,
    double valueAmp,
  }) {
    return BombaAguaState(
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

class BombaAguaBloc extends Bloc <BombaAguaEvent, BombaAguaState> {
   var ID = IdComponent.BOMBA_AGUA;
  @override
  // TODO: implement initialState
  BombaAguaState get initialState => BombaAguaState.initial();

  @override
  Stream<BombaAguaState> mapEventToState(BombaAguaEvent event) async* {
    if (event is Enable) {
      yield* _setInitValuesAndSendBT(event);
    //  yield* _setInitValuesAndSendBT(event);

    } else if (event is Disable) {
      yield BombaAguaState (
        valueAmp: 0.0,
        isEnabled: false,
      );
    }
  }


  Stream<BombaAguaState> _setInitValuesAndSendBT(BombaAguaEvent event) async* {
   print("_setInitValuesAndSendBT");
   List<int> elems = new List<int>();
   elems.add(0x02);
   elems.add(0x00);
   elems.add(0x02);
   elems.add(ID);
   elems.add(0x00);
   elems.add(0x33);
   elems.add(0x33);
   try {
      BluetoothRepository.sendData(elems);
      yield BombaAguaState.initial();
    } catch(e) {
     print(e);
   }
  }
}
