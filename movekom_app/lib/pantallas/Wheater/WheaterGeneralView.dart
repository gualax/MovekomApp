import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_ext.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_int.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterCalefactionView extends StatefulWidget {
  @override
  _WheaterCalefactionViewState createState() => _WheaterCalefactionViewState();
}

class _WheaterCalefactionViewState extends State<WheaterCalefactionView> {
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return contenido();
  }



  Widget contenido() {
    return Container(
     //   margin: EdgeInsets.only(top: SC.all(10)),
        // color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Calefaccion(2),
            container(),
           // AireAcondicionado(2),
          ],
        ),
    );
  }




  Widget container() {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WeatherBox(0,1),
          Extractor(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TemperatureInt(2),
              TemperatureExt(2),
            // box247x144(),
            ],
          ),
        ],
      ),

    );
  }



}
