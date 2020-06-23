
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movekomapp/MapeoIDs/IdComponents.dart';
import 'package:movekomapp/bluetooth/BluetoothRepository.dart';

abstract class BombaAguaEvent extends Equatable {
  BombaAguaEvent([List props = const []]) : super(props);
}

class EnableBomba extends BombaAguaEvent {  /// Habilita la bateria
  bool isEnabled = true;

  @override
  List<Object> get props => [isEnabled];
}

class DisableBomba extends BombaAguaEvent { /// Deshabilita la bateria
  bool isEnabled = false;

  @override
  List<Object> get props => [isEnabled];
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

  factory BombaAguaState.disabled() {
    return BombaAguaState(
      isEnabled: false,
      valueAmp: 0.0,
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
  List<Object> get props => [isEnabled,valueAmp];
}
/// FIN  declaracion de STATE

class BombaAguaBloc extends Bloc <BombaAguaEvent, BombaAguaState> {
   var ID = IdComponent.BOMBA_AGUA;
  @override
  // TODO: implement initialState
  BombaAguaState get initialState => BombaAguaState.initial();

  @override
  Stream<BombaAguaState> mapEventToState(BombaAguaEvent event) async* {
    if (event is EnableBomba) {
      yield* _setValuesAndSendBT(true);
    //  yield* _setInitValuesAndSendBT(event);
    } else if (event is DisableBomba) {
      yield* _setValuesAndSendBT(false);
    }
  }


  Stream<BombaAguaState> _setValuesAndSendBT(bool status) async* {
   print("_setInitValuesAndSendBT");
   List<int> elems = new List<int>();
   elems = generateData(status);
   try {
      BluetoothRepository.sendData(elems);
      if (status)
        yield BombaAguaState.initial();
      else
        yield BombaAguaState.disabled();
   } catch(e) {
     print(e);
   }
  }


   List<int> generateData(status) {
     var value;
     if (status){
       value = 0x01;
     }else {
       value = 0x00;
     }
     List<int> elems = new List<int>();
     elems.add(IdComponent.HEADER); // header
     elems.add(0x00);  //
     elems.add(0x00); // cantidad de bytes a continuacion con CRC incluido
     elems.add(ID);
     elems.add(value);
     elems.add(IdComponent.CRC1); // header
     elems.add(IdComponent.CRC2); // headere
     print(elems.length);
     elems[2] = 0x00 + (elems.length - 3);
     return elems;
   }


}



//0x03 0x50 0xff recibio bien