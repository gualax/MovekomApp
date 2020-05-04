
import 'package:flutter/material.dart';
import 'package:movekomapp/blocs/panel_solar_bloc.dart';
import 'package:movekomapp/controladores/electricidad/Alternador.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux2.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Cargador.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
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
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 13),
             //   color: Colors.lightGreen,
                alignment: Alignment.center,
             //  color: Colors.orange,
                child: baterias_cargadores(),
              ),
            ),
            Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20),
           //   color: Colors.blue,
              alignment: Alignment.center,
         //    color: Colors.blue,
              child: inversores_cargadores(),
             ),
            )
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
        Inversor(),
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
          BateriaMotorAux2(2),
          totalizador(),
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
         // BateriaMotor2(),
          Cargador220(),
       //   chargeBox("Carga de 220","assets/icons/energy_2.svg",50,23.65),
          //chargeBox("Carga de panel solar","assets/icons/solar_panel_1.svg",50,23.65),
          PanelSolar(),
          chargeBox("Consumo instantaneo","assets/icons/electricidad.svg",50,23.65),
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



  Widget totalizador(){
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
          top:80,
          right: 40,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                "Ah", style: MyTextStyle.estiloBold(25, Colors.white)),
          ),
        ),
        Positioned.fill(
          top:5,
          left: 10,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
                "Totalizador", style: MyTextStyle.estiloBold(20, Colors.white)),
          ),
        ),
        Positioned.fill(
          left: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: iconSvgD("assets/icons/electricidad.svg",Colors.orange,100),
          ),
        ),
        Positioned.fill(
          right: 10,
          bottom: 10,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                "40", style: MyTextStyle.estiloBold(80, Colors.white)),
          ),
        ),
        Positioned.fill(
          bottom:25,
          child: Align(
            alignment: Alignment.bottomCenter,
            child:Text(
                "Nº ciclos de AUX 1", style: MyTextStyle.estilo(15, Colors.white)),
          ),
        ),
        Positioned.fill(
          bottom:5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child:Text(
                "Nº ciclos de AUX 2", style: MyTextStyle.estilo(15, Colors.white)),
          ),
        ),
      ],
    ),
    );
  }

}

