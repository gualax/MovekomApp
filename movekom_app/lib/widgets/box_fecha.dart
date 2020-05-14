import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class FechaWidget extends StatefulWidget {
  @override
  _FechaWidgetState createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v){
      setState(() {
        dateTime = DateTime.now();
        print(dateTime.hour);
      });
      });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return box137x137_Fecha_Hora();
  }


  Widget box137x137_Fecha_Hora(){
    return
      Container(
          margin: EdgeInsets.all(7),
          width: 137,
          height: 137,
          decoration: new BoxDecoration(
              color: Color(0xff2d3033)
          ), child: Stack(
          children: [
            Positioned.fill( /// Icono
              left: 14,
              bottom: 14,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/calendario.svg", Colors.white,30),
              ),
            ),
            // Valvulas (Todas)
            Positioned.fill(   /// Titulo
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
            Positioned.fill(   /// DIA
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
            Positioned.fill(   /// HORA
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
      "Domingo",
      "Lunes",
      "Martes",
      "Miercoles",
      "Jueves",
      "Viernes",
      "Sabado",
    ];
    return days[day];
  }

}