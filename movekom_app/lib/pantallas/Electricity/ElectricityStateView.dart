
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/electricidad_blocs/panel_solar_bloc.dart';
import 'package:movekomapp/controladores/electricidad/Alternador.dart';
import 'package:movekomapp/controladores/electricidad/AmperimetroGeneral.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux2.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Cargador.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Consumos.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ElectricityStateView extends StatefulWidget {
  @override
  _ElectricityStateViewState createState() => _ElectricityStateViewState();
}

class _ElectricityStateViewState extends State<ElectricityStateView> {

  @override
  Widget build(BuildContext context) {
  //  final bateriaMotorBloc = BlocProvider.of<BateriaMotorBloc>(context);


    return  Container(
        alignment: Alignment.center,
      child: Row(
        children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 13),
             //   color: Colors.lightGreen,
                alignment: Alignment.center,
             //  color: Colors.orange,
                child: baterias_cargadores(),
              ),
            ),
      ],
      ),
      );
  }

  Widget baterias_cargadores(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row1(),
        Row2(),
      ],
    );
  }

  Widget inversores_cargadores(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Inversor(2),
        CargadorBaterias(),
      ],
    );
  }
  Widget Row1() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BateriaMotor(2),
          BateriaMotorAux1(2),
         // BateriaMotorAux2(2),
          AmperimetroGeneral(),
        ],
      ),
    );
  }

  Widget Row2() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Alternador(),
          Cargador220(),
          PanelSolar(),
         // chargeBox("Consumo instantaneo","assets/icons/electricidad.svg",50,23.65),
          Consumos(),
        ],
      ),
    );
  }


  Widget chargeBox(title, iconRoute,ampValue,totValue) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      height: 214,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top: 10,
            right: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: iconSvgD(iconRoute, Colors.white, 35),
            ),
          ),
          Positioned.fill(
            top: 10,
            left: 10,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: MyTextStyle.estiloBold(15, Colors.white)),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  ampValue.toString(), style: MyTextStyle.estiloBold(40, Colors.white)),
            ),
          ),
          Positioned.fill(
            top:55,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "Ah", style: MyTextStyle.estiloBold(25, Colors.white)),
            ),
          ),
          Positioned.fill(
            bottom:10,
            right: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                  "Totalizador", style: MyTextStyle.estilo(15, Colors.white)),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            right: 20,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                  totValue.toString() + "A", style: MyTextStyle.estilo(15, Colors.white)),
            ),
          )
        ],
      ),
    );
  }

}

