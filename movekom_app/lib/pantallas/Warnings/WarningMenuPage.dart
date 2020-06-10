
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
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
import 'package:movekomapp/responsive_ui/mi_container.dart';

class WarningMenuPage extends StatefulWidget {
  @override
  _WarningMenuPageState createState() => _WarningMenuPageState();
}

class _WarningMenuPageState extends State<WarningMenuPage> with SingleTickerProviderStateMixin {
  BuildContext mContext;
  int _currentIndex=0;
  TabController _tabController;


  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: _children.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Scaffold(
        backgroundColor: Colors.black,
        body:  MyContainer(
          // color: Colors.blueGrey,
            margin: EdgeInsets.only(top: SC.top(10),left: SC.left(60),right: SC.right(60)),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                //    color: Colors.yellowAccent,
                    child: buttonTabTextMenu(),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: MyContainer(
                 //    color: Colors.blueGrey,
                    child: new TabBarView(
                      controller: _tabController,
                      children: _children,
                    ),
                  ),
                )
              ],
            )
        ),
      );
  }

  List<Widget> _children = [
    WarningAlarmsView(),
    WarningHistoryView(),
  ];

  Widget show(int index, context) {
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: MyContainer(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: SC.right(200), left: SC.left(200)),
        //color: Colors.yellowAccent,
        child: TabBar(
          onTap: (index) {
            changePage(index);
          },
          controller: _tabController,
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