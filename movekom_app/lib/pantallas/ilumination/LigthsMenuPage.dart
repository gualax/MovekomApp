

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/blocs/upligth_bloc.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                columRowIlu(),
                rowTime(),
                ]),
              ),
    );
  }

  Widget columRowIlu(){
    return Container(
        child: Column(
          children: <Widget>[
            rowLigths1(),
            rowLigths2(),
          ],
        ),
    );
  }


  Widget rowTime(){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarraDeConsumos(),
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
          LucesSalon(),
          LucesCocina(),
          LucesBano(),
          LigthsBedroom(),
          ModoLuz2(2),
        ],
      ),
    );
  }

  Widget rowLigths2(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LucesExterior(),
          LuzGeneral(),
          Upligth(),
          Downligth(),
          ModoLuz1(2),
        ],
      ),
    );
  }




}
