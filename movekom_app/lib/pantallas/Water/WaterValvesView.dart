import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasNegras.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

class WaterValvesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AguaLimpiaValve(),
          AguaScuiasValve(),
          AguasNegrasValve(),
        ],
      ),
    );
  }


  Widget AguaLimpiaValve(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AguasLimpias(4),
          AguasLimpias(3),
          AguasLimpias(5),
        ],
      ),
    );
  }

  Widget AguaScuiasValve(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AguasSucias(4),
          AguasSucias(3),
          AguasSucias(5),
        ],
      ),
    );
  }
  Widget AguasNegrasValve(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AguasNegras(4),
          AguasNegras(3),
          AguasNegras(5),
        ],
      ),
    );
  }


}
