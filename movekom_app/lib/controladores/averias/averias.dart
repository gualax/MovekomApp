import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class Averia extends StatelessWidget {
  DateTime dateTime;
  String title  = "AVERIA CALEFACTOR F12";
  String description = "Bloqueo de calefactor tras varios intentos de arranque";
  String section = "CLIMA Calefaccion";
  @override
  Widget build(BuildContext context) {
     dateTime = DateTime.now();
    return alertBox();
  }


  Widget alertBox(){
    return MyContainer(
      height: 100,
      width: 900,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill( /// fecha
            top:5, left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(fecha(),
                  style: MyTextStyle.estilo(18, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// title
              top:5, left: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                    style: MyTextStyle.estilo(18, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// description
              left: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(description,
                    style: MyTextStyle.estilo(17, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// section
              right: 5,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(section,
                    style: MyTextStyle.estilo(17, MyColors.text),
                  textAlign:  TextAlign.center , ) ,
              )
          ),
          MyPositioned.fill(  /// icono
              left: 20,top: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child:iconSvgNc("assets/icons/warning.svg", 28),
              )
          ),
        ],
      ),
    );
  }


  String fecha(){
    return
      dateTime.day.toString() + "/"
       + dateTime.month.toString() + "/"
       + dateTime.year.toString() + " a las "
        + dateTime.hour.toString() + ":"
        + dateTime.minute.toString();
  }

}
