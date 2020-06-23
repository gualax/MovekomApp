import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movekomapp/MapeoIDs/IdComponents.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/agua_blocs/bomba_agua_bloc.dart';

class BackGroundData2 extends StatelessWidget {
  BuildContext mcontext;

  @override
  Widget build(BuildContext context) {
    print("BackGroundData2");
    mcontext  = context;
    return Container(
    );
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
   //executeAction();
  }


   void executeAction(){
    print("executeAction");
     TabChanger tabChanger =  TabChanger(mcontext);
     tabChanger.changeTab(2);
    // BombaAguaBloc bomabaAguaBloc = BlocProvider.of<BombaAguaBloc>();
    // bomabaAguaBloc.add(Disable());
  }

}
