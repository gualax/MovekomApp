
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
import 'package:movekomapp/controladores/modos/ModoAhorroEnergia.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasAuto.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasBasico.dart';
import 'package:movekomapp/controladores/modos/ModoDescanso.dart';
import 'package:movekomapp/controladores/modos/ModoEco.dart';
import 'package:movekomapp/controladores/modos/ModoEmergencia.dart';
import 'package:movekomapp/controladores/modos/ModoHighwayToHell.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaTuberias.dart';
import 'package:movekomapp/controladores/modos/ModoParking.dart';
import 'package:movekomapp/controladores/nevera/nevera.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

class ToolsMenuPage extends StatefulWidget {
  @override
  _ToolsMenuPageState createState() => _ToolsMenuPageState();
}

class _ToolsMenuPageState extends State<ToolsMenuPage> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MyContainer(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            column1(),
            column2(),
          ],
        )
      ),
    );
  }

Widget column1(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Nevera(2),
          Inversor(2),
        ],
      ),
    );
}


  Widget column2(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CargadorBaterias(),
          PanelSolar(2),
        ],
      ),
    );
  }

  Widget emptyBox(){
    return MyContainer(
        width: 420, height: 220,
    );
  }

  Widget box(){
    return Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.only(left: 80,right: 80,top:50,bottom: 50),
      child: GridView.count(
        childAspectRatio: 2.7,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children:[
          Inversor(2),
          CargadorBaterias(),
          Nevera(2),
        ]
      ),
    );
  }

}