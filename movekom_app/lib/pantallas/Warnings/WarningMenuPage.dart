
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/controladores/modos/ModoAhorroEnergia.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasAuto.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasBasico.dart';
import 'package:movekomapp/controladores/modos/ModoDescanso.dart';
import 'package:movekomapp/controladores/modos/ModoEco.dart';
import 'package:movekomapp/controladores/modos/ModoEmergencia.dart';
import 'package:movekomapp/controladores/modos/ModoHighwayToHell.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaTuberias.dart';
import 'package:movekomapp/controladores/modos/ModoParking.dart';
import 'package:movekomapp/pantallas/Warnings/WarningAlarmsView.dart';
import 'package:movekomapp/pantallas/Warnings/WarningHistoryView.dart';

class WarningMenuPage extends StatefulWidget {
  @override
  _WarningMenuPageState createState() => _WarningMenuPageState();
}

class _WarningMenuPageState extends State<WarningMenuPage> {
  BuildContext mContext;
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Scaffold(
        backgroundColor: Colors.black,
        body:  Container(
          // color: Colors.blueGrey,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                //    color: Colors.yellowAccent,
                    child: buttonTabTextMenu(),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                 //    color: Colors.blueGrey,
                    child: show(_currentIndex, context),
                  ),
                )
              ],
            )
        ),
      );
  }



  Widget show(int index, context) {
    List<Widget> _children = [
      WarningAlarmsView(),
      WarningHistoryView(),
    ];
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 200, left: 200),
        //color: Colors.yellowAccent,
        child: TabBar(
          onTap: (index) {
            changePage(index);
          },
          indicatorColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightGreenAccent,
          tabs: [
            Tab(text: "ALARMAS"),
            Tab(text: "HISTORIAL DE ALARMAS"),
          ],
        ),
      ),
    );
  }


  changePage(int index) {
    setState(() {
      _currentIndex = index;
      print("index is : " + index.toString());
    });
  }
}