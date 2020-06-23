


import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movekomapp/MapeoIDs/IdComponents.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/agua_blocs/bomba_agua_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/nevera_bloc.dart';

class BackgroundDataProcessor {
BuildContext mcontext;

BackgroundDataProcessor(BuildContext context) {
  mcontext = context;
}

void processData(Uint8List data){

  var list = new List.from(data);
  for(var item in list){
    print(item.toRadixString(16));
    if(0x50 == item){
      print("ENCONTRADO => " + item.toRadixString(16) + item.toString());
    }
  }
  print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
  List<int> elems = new List<int>();
  elems.add(IdComponent.HEADER); // header
  elems.add(0x00);  //
  elems.add(0x00); // cantidad de bytes a continuacion con CRC incluido
  elems.add(0x50);
  elems.add(0x00);
  elems.add(IdComponent.CRC1); // header
  elems.add(IdComponent.CRC2); // headere
  executeAction();
}

void  executeAction(){
  print("executeAction");
   BombaAguaBloc bomabaAguaBloc = BombaAguaBloc();
   bomabaAguaBloc.add(DisableBomba());

//  NeveraBloc neveraBloc = new NeveraBloc();
 // neveraBloc.add(DisableNevera());
}





}