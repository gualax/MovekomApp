
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: MyContainer(
        padding: EdgeInsets.only(right: 125,left: 125),
        margin: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            rows1(),
            rows2(),
          ],
        ),
      ),
    );
  }

Widget rows1(){
    return MyContainer(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Nevera(),
          Inversor(2),
        ],
      ),
    );
}


  Widget rows2(){
    return MyContainer(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CargadorBaterias(),
          emptyBox(),
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
          Nevera(),
        ]
      ),
    );
  }

}