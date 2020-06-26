
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Constants.dart';
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
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

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
            versionModel(),
          ],
        ),
        Row(
          children: <Widget>[
            box2("MODELO DE BOILER"),
            box2("MODELO DE CALEFACCION"),
          ],
        )
      ],
    );
  }

  //BluetoothController(),
  Widget versionModel(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 190.00,
      width: 190.00,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              top: 10, left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("ID RPZ",
                  style:MyTextStyle.estilo(18, MyColors.text),),
              )),
          MyPositioned.fill(
              bottom: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text("Nº SERIE",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.center,
                child: Text("RPZ05656",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
            top:20,
              child: Align(
                alignment: Alignment.center,
                child: Text("VERSION",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top: 60,
              child: Align(
                alignment: Alignment.center,
                child: Text(Constants.HARDWARE_VERSION,
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top:105,
              child: Align(
                alignment: Alignment.center,
                child: Text("VERSION",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
            bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(Constants.SOFTWARE_VERSION,
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
        ],
      ),
    );
  }

  Widget box2(title){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 83.00,
      width: 190.00,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                  style:MyTextStyle.estilo(16, MyColors.text),
                  textAlign:TextAlign.center ,),
              ))
        ],
      ),
    );
  }


}