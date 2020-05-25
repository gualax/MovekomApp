import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class FechaWidget extends StatefulWidget {
  @override
  _FechaWidgetState createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  DateTime dateTime = DateTime.now();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(Duration(seconds: 20), (v){
      setState(() {
        if (this.mounted) {
          dateTime = DateTime.now();
          print(dateTime.hour);
        }
      });
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return box137x137_Fecha_Hora();
  }


  Widget box137x137_Fecha_Hora(){
    return
      MyContainer(
          margin: EdgeInsets.all(7),
          width: 137,
          height: 137,
          decoration: new BoxDecoration(
              color: MyColors.baseColor
          ), child: Stack(
          children: [
            MyPositioned.fill( /// Icono
              left: 14,
              bottom: 14,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/calendario.svg", Colors.white,30),
              ),
            ),
            // Valvulas (Todas)
            MyPositioned.fill(   /// Titulo
              top:4,
              child:   Align(
                alignment: Alignment.topCenter,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(15, Colors.white),
                              text: "FECHA / HORA"
                          ),
                        ]
                    )
                ),
              ),
            ),
            MyPositioned.fill(   /// DIA
              right: 14,
              bottom: 14,
              child:   Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            style: MyTextStyle.estilo(13, Colors.white),
                            text: dateTime.day.toString() + " " + diaStr(dateTime.weekday),
                          ),
                        ]
                    )
                ),
              ),
            ),
            MyPositioned.fill(   /// HORA
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            style: MyTextStyle.estilo(40, Colors.white),
                            text: dateTime.hour.toString() + ":" + dateTime.minute.toString(),
                          ),
                        ]
                    )
                ),
              ),
            ),
          ])
      );
  }

  String diaStr(int day){
    List<String> days = [
      "Lunes",
      "Martes",
      "Miercoles",
      "Jueves",
      "Viernes",
      "Sabado",
      "Domingo",
    ];
    return days[day-1];
  }

}
