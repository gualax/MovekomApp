
import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/electricidad/Alternador.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Cargador.dart';
import 'package:movekomapp/controladores/electricidad/Consumos.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
import 'package:movekomapp/controladores/electricidad/Totalizador.dart';



class ElectricityGeneralView extends StatefulWidget {
  @override
  _ElectricityGeneralViewState createState() => _ElectricityGeneralViewState();
}

class _ElectricityGeneralViewState extends State<ElectricityGeneralView> {

  @override
  Widget build(BuildContext context) {
  //  final bateriaMotorBloc = BlocProvider.of<BateriaMotorBloc>(context);
    return  Container(
           child: baterias_cargadores(),
      );
  }

  Widget baterias_cargadores(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row1(),
        Row2(),
      ],
    );
  }

  Widget Row1() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BateriaMotor(2),
          BateriaMotorAux1(2),
          Totalizador(2),
        ],
      ),
    );
  }

  Widget Row2() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Alternador(),
          Cargador220(1),
          PanelSolar(1),
          Consumos(),
        ],
      ),
    );
  }



}

