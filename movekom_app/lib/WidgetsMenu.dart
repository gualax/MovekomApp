import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/agua/Boiler.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/box225x137.dart';
import 'package:movekomapp/ww/luz_exterior_widget.dart';
import 'package:movekomapp/ww/luz_general_widget.dart';
import 'package:movekomapp/ww/upligth_widget.dart';

import 'Utils/MyColors.dart';
import 'Utils/SC.dart';
import 'controladores/agua/BombaAgua.dart';
import 'controladores/agua/ItemBoiler.dart';
import 'controladores/climatizacion/Calefaccion.dart';
import 'ww/temperature_widget.dart';
import 'controladores/electricidad/Inversor.dart';
import 'controladores/nevera/nevera.dart';

class WidgetsMenu extends StatefulWidget {
  @override
  _WidgetsMenuState createState() => _WidgetsMenuState();
}

class _WidgetsMenuState extends State<WidgetsMenu> {
  @override
  Widget build(BuildContext context) {
    return _buildAboutDialog();
  }



  Widget _buildAboutDialog() {
    return new AlertDialog(
      backgroundColor: Colors.black,
      title:  Text('WIDGETS',
          style:MyTextStyle.estiloBold(15, Colors.white)),
      content:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            row1(),
            row2(),
          ],
        ),
      ),
    );
  }

Widget row1(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        widgetBoiler(),
        Calefaccion(1),
        Inversor(1),
        CargadorBaterias(2),
      ],
    );
}

  Widget row2(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      WeatherBox(0,2),
      Nevera(3),
      BombaAgua(3),
      TemperatureWW(),
      LuzExtWW(),
      LuzGenWW(),
      LuzUpligthWW(),
      ],
    );
  }


  Widget item(){
    return MyContainer(
      height: 100,
      width: 100,
      child:iconSvgD(
          "assets/icons/pdf_view.svg",
          Colors.white, 15),
    );
  }


}





