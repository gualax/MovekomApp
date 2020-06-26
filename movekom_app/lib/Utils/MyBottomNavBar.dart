import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movekomapp/pantallas/Alarm/AlarmGeneralView.dart';
import 'package:movekomapp/pantallas/Configuration/ConfigMenuPage.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityMenuPage.dart';
import 'package:movekomapp/pantallas/ManualesPage/ManualesMenuPage.dart';
import 'package:movekomapp/pantallas/ModesPage/ModesMenuPage.dart';
import 'package:movekomapp/pantallas/PrincipalHome.dart';
import 'package:movekomapp/pantallas/Reles/ElectricityReleView.dart';
import 'package:movekomapp/pantallas/Tools/ToolsMenuPage.dart';
import 'package:movekomapp/pantallas/Warnings/WarningMenuPage.dart';
import 'package:movekomapp/pantallas/Water/WaterMenuPage.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterMenuPage.dart';
import 'package:movekomapp/pantallas/ilumination/LigthsMenuPage.dart';

import 'SizeConfig.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
int _currentIndex = 0;
GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

  List<Widget> pageList= [
    PrincipalHome(),
    ClimaPage(),
    ElectricityPage(),
    ElectricityReleView(),
    WaterMenuPage(),
    AlarmGeneralView(),
    LightsMenuPage(),
    ModesMenuPage(),
    ManualesMenuPage(),
    ToolsMenuPage(),
    WarningMenuPage(),
    ConfigMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new BottomNavigationBar(
        key: globalKey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/home.svg", true),
            activeIcon: activeIcon("assets/icons/home.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/fire.svg", true),
            activeIcon: activeIcon("assets/icons/fire.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/electricidad.svg", true),
            activeIcon: activeIcon("assets/icons/electricidad.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/rele_bar_icon.svg", true),
            activeIcon: activeIcon("assets/icons/rele_bar_icon.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/gota_agua.svg",true),
            activeIcon: activeIcon("assets/icons/gota_agua.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/candado.svg",true),
            activeIcon: activeIcon("assets/icons/candado.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/luz.svg", true),
            activeIcon: activeIcon("assets/icons/luz.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/capa_2.svg", false),
            activeIcon: activeIcon("assets/icons/capa_2.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/cuadro_alerta.svg", false),
            activeIcon: activeIcon("assets/icons/cuadro_alerta.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/caja_herramientas.svg", false),
            activeIcon: activeIcon("assets/icons/caja_herramientas.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/alerta_triangulo.svg", false),
            activeIcon: activeIcon("assets/icons/alerta_triangulo.svg"),
            title: new Text(""),
          ),
          new BottomNavigationBarItem(
            icon: iconSvg("assets/icons/config2.svg", false),
            activeIcon: activeIcon("assets/icons/config2.svg"),
            title: new Text(""),
          ),
        ]);
  }

  Widget iconSvg(assetName,isEnabled){
    Color color;
    if(isEnabled == true) {
      color = Colors.white;
    }else{
      color = Colors.grey;
    }
    return  SvgPicture.asset(
      assetName,
      height: SizeConfig.v * 5.7,
      width: SizeConfig.h * 5.5,
      color: color,
    );
  }


  Widget iconSvgActive(assetName,color){
    return  SvgPicture.asset(
      assetName,
      height: SizeConfig.v * 5.7,
      width: SizeConfig.h * 5.5,
      color: color,
    );
  }

  Widget activeIcon(iconRoute){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color:Colors.lightGreenAccent,
          offset: Offset(0,0),
          blurRadius: 35,
          //  spreadRadius: 10
        )] ,
      ),
      child: iconSvgActive(iconRoute, Colors.lightGreenAccent),
    );
  }

  Widget show(int index, context){
    return  pageList[index];
  }

  void onTabTapped(int index) {
    print("HomePage -> onTabTapped");
    setState(() {
      _currentIndex = index;
      // tabController.animateTo(_currentIndex);
    //  changeBarTitle(_currentIndex);
      print("index is : " + index.toString());
    });
  }




}
