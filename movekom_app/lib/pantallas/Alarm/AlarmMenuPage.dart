


import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class AlarmMenuPage extends StatefulWidget {
  @override
  _AlarmMenuPageState createState() => _AlarmMenuPageState();
}

class _AlarmMenuPageState extends State<AlarmMenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  alarma(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    box("LUCES PERIMETRO","assets/icons/spotlight.svg"),
                    box("LUZ AUTOMATICA","assets/icons/alarm_sensor.svg"),
                    box_ajustes("MAS AJUSTES","assets/icons/configuracion.svg"),
                  ],
                )
              ],
          )
      ),
    );
  }



  Widget box(title,iconRoute){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 116,
      width: 137,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
      MyPositioned.fill(
      top:5,left: 5,
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(title,
              style: MyTextStyle.estilo(16, MyColors.text),
          textAlign: TextAlign.center,),
        ),
      ),
      MyPositioned.fill(
        top:10,right: 10,
        child: Align(
          alignment: Alignment.topRight,
          child: circuloConSombra(10, MyColors.principal),
        ),
      ),
      MyPositioned.fill(
        top: 20,
        child: Align(
          alignment: Alignment.center,
          child: iconSvgD(iconRoute, MyColors.principal, 40),
        ),
      ),
    ],
      ),
    );
  }

  Widget box_ajustes(title,iconRoute){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 116,
      width: 137,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:5,left: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                style: MyTextStyle.estilo(15, MyColors.text),
                textAlign: TextAlign.center,),
            ),
          ),
          MyPositioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, MyColors.text, 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget alarma(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      height: 278,
      width: 278,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:5,left: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("ALARMA",
                style: MyTextStyle.estilo(18, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            top:10,right: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: circuloConSombra(17, MyColors.principal),
            ),
          ),
          MyPositioned.fill(
            top:50,right: 20,
            child: Align(
              alignment: Alignment.topRight,
              child: iconSvgD("assets/icons/shield.svg", MyColors.principal, 125),
            ),
          ),
          MyPositioned.fill(
            top:40,left: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD("assets/icons/parking.svg", MyColors.principal, 120),
            ),
          ),
          MyPositioned.fill(
            bottom:5, right: 160,
            child: Align(
              alignment: Alignment.bottomCenter,
              child:IconButton(
                icon: Icon(Icons.power_settings_new),
                iconSize: SC.all(30),
                color: MyColors.principal,
                onPressed: () {},
              ),
            ),
          ),
          MyPositioned.fill(
            bottom:17,left: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Pulsar para encender",
                  style: MyTextStyle.estilo(15, MyColors.text)),
            ),
          ),
        ],
      ),
    );
  }

}

