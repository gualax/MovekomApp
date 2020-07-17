

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';
import 'package:movekomapp/controladores/iluminacion/BarraDeConsumos.dart';
import 'package:movekomapp/controladores/iluminacion/Downligth.dart';
import 'package:movekomapp/controladores/iluminacion/LigthsBedRoom.dart';
import 'package:movekomapp/controladores/iluminacion/LucesBano.dart';
import 'package:movekomapp/controladores/iluminacion/LucesCocina.dart';
import 'package:movekomapp/controladores/iluminacion/LucesExterior.dart';
import 'package:movekomapp/controladores/iluminacion/LucesSalon.dart';
import 'package:movekomapp/controladores/iluminacion/LuzGeneral.dart';
import 'package:movekomapp/controladores/iluminacion/ModoLuz1.dart';
import 'package:movekomapp/controladores/iluminacion/ModoLuz2.dart';
import 'package:movekomapp/controladores/iluminacion/Upligth.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class LightsMenuPage extends StatefulWidget {
  @override
  _LightsMenuPageState createState() => _LightsMenuPageState();
}

class _LightsMenuPageState extends State<LightsMenuPage> {
  BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.blueGrey,
       //   margin: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              generalAndSaveColumn(),
                columRowIlu(),
                rowModes(),
                ]),
              ),
    );
  }

  Widget rowModes(){
    return Row(
      children: <Widget>[
        modesColumn(),
        columnModeSave(),
      ],
    );
  }

  Widget modesColumn(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ModoLuz1(2),
        ModoLuz2(2),
      ],
    );
  }


  Widget generalAndSaveColumn(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LuzGeneral(2),
        LuzGeneral(3),
        //rowTimeSave(),
      ],
    );
  }


  Widget consumoActual(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 200,
      width: 125,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 15,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("CONSUMO ACTUAL ILUMINACION",
                  style:MyTextStyle.estilo(14, MyColors.text),
                  textAlign: TextAlign.center,),
              )
          ),
          MyPositioned.fill(
            top: 25,
              child: Align(
                alignment: Alignment.center,
                child: Text("12",
                  style:MyTextStyle.estiloBold(45, MyColors.text),
                  textAlign: TextAlign.center,),
              )
          ),
          MyPositioned.fill(
            top:45,left: 70,
              child: Align(
                alignment: Alignment.center,
                child: Text("A",
                  style:MyTextStyle.estiloBold(16, MyColors.text),
                  textAlign: TextAlign.center,),
              )
          ),
        ],
      ),
    );
  }


  Widget columRowIlu(){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rowLigths1(),
            rowLigths2(),
          ],
        ),
    );
  }


  Widget columnModeSave(){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ModoLuz1(1),
            ModoLuz2(1),
          ],
        ),
    );
  }

  Widget rowLigths1(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LucesCocina(1),
          LucesBano(1),
          LigthsBedroom(1),
        ],
      ),
    );
  }

  Widget rowLigths2(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LucesSalon(1),
          LucesExterior(2),
          Upligth(2),
        ],
      ),
    );
  }

}
