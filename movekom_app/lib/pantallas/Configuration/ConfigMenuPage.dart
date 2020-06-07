
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/ajustes/wifi/wifiController.dart';
import 'package:movekomapp/bluetooth/BluetoothController.dart';
import 'package:movekomapp/controladores/ajustes/BuscarActualizaciones.dart';
import 'package:movekomapp/controladores/ajustes/ModoAlquiler.dart';
import 'package:movekomapp/controladores/ajustes/ModoProfesional.dart';
import 'package:movekomapp/controladores/ajustes/ResetFabrica.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

class ConfigMenuPage extends StatefulWidget {
  @override
  _ConfigMenuPageState createState() => _ConfigMenuPageState();
}

class _ConfigMenuPageState extends State<ConfigMenuPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            column1(),
            column2(),
          ],
        ),
      ),
    );
  }


  Widget column1(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            BluetoothController(),
            WifiController(),
          ],
        ),
        Row(
          children: <Widget>[
            ModoProfesional(),
            Reset(),
            ModoAlquiler(),
          ],
        )
      ],
    );
  }

  Widget column2(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            BuscarActualizaciones(),
            box1(),
          ],
        ),
        Row(
          children: <Widget>[
            box2(),
            box2(),
          ],
        )
      ],
    );
  }

  //BluetoothController(),
  Widget box1(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 190.00,
      width: 190.00,
      color: MyColors.baseColor,
    );
  }

  Widget box2(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 83.00,
      width: 190.00,
      color: MyColors.baseColor,
    );
  }

}