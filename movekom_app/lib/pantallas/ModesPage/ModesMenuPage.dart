
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasAuto.dart';
import 'package:movekomapp/controladores/modos/ModoCicloBaterias.dart';
import 'package:movekomapp/controladores/modos/ModoDescanso.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaCalef.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaTuberias.dart';
import 'package:movekomapp/controladores/modos/ModoPanelSolar.dart';
import 'package:movekomapp/controladores/modos/ModoLargaDist.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

class ModesMenuPage extends StatefulWidget {
  @override
  _ModesMenuPageState createState() => _ModesMenuPageState();
}

class _ModesMenuPageState extends State<ModesMenuPage> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: columns(),
      ),
    );
  }



  Widget horizontalList(){
    return Container(
      alignment: Alignment.center,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        columns(),
      ],
    ),
    );
  }

  Widget columns(){
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          row1(),
          row2(),
        ],
      ),
    );
  }


  Widget row1(){
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //ModoAhorroEnergia(),
          ModoPanelSolar(1),
          ModoAntiHeladasAuto(1),
          ModoDescanso(1),
          ModoCicloBaterias(),
        ],
      ),
    );
  }


  Widget row2(){
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ModoLimpiezaTuberias(1),
          ModoLimpiezaCalefaccion(1),
          ModoLargaDist(1),
      //    ModoAntiHeladasBasico(),
          box(),
        ],
      ),
    );
  }


  Widget box(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(Dimens.MODES_SEPARATION)),
      width: 210,
      height: 230,

    );
  }

}