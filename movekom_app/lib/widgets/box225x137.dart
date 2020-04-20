

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

Widget box225x140(title, textAbajoIzq, textAbajoDer, textArribaDer){
  return  Container(
      margin: EdgeInsets.all(7),
      width: 225,
      height: 140,
      decoration: BoxDecoration(
          color: const Color(0xff2d3033)
      ),
      child: Stack(children: [
        // Valvulas (Todas)
        PositionedDirectional(
          top: 4,
          start: 10,
          child:   RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        style:estiloBold(),
                        text: title ),
                  ]
              )
          ),
        ),
        // OFF
        PositionedDirectional(
          bottom: 4,
          start: 24,
          child:   Text(
              textAbajoIzq,
              style: estilo(),
              textAlign: TextAlign.center
          ),
        ),
        // 2.65 A
        PositionedDirectional(
            bottom: 4,
            end: 10,
            child:   Text(
                textAbajoDer,
                style: estilo(),
                textAlign: TextAlign.center
            )
        )
      ])
  );
}




Widget box225x140_1icon_text(title, double valueAmp,
    iconRoute, textValue, state){
 Color color;
 Color colorText;
 String on_off;
  if(state){
    color = Colors.lightGreenAccent;
    colorText = Colors.white;
    on_off = "ON";
  }else{
   color = Colors.grey;
   colorText = Colors.grey;
   on_off = "OFF";
  }
  return  ClipRect(
    child: Container(
        margin: EdgeInsets.all(7),
        width: 225,
        height: 140,
        decoration: BoxDecoration(
            color: const Color(0xff2d3033)
        ),
        child: Stack(children: [
          // Valvulas (Todas)
          Positioned.fill(  ///titulo
            top: 4,
             left: 8,
             child:   Align(
               alignment: Alignment.topLeft,
              child: Text(
               title,
               style: MyTextStyle.estiloBold(18, colorText),
            ),
            ),
          ),
          Positioned.fill(    ///textAbajoIzq
            left: 8,
            bottom: 6,
            child:  Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                  on_off,
                  style: MyTextStyle.estilo(18, color),
              ),
            ),
          ),
          Positioned.fill(  ///textAbajoDer
            right: 8,
            bottom: 6,
            child:  Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Consumo" + valueAmp.toString() + "A",
                style: MyTextStyle.estilo(18, colorText),
              ),
            ),
          ),
          Positioned.fill(  ///icon
            left: 25,
            child:  Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD(iconRoute, color, 75),
            ),
          ),
          Positioned.fill(  ///textValue
            right: 30,
            child:  Align(
              alignment: Alignment.centerRight,
              child: Text(
                textValue,
                style: MyTextStyle.estiloBold(45, colorText),
              ),
            ),
          )
        ])
    ),
  );
}


Widget box225x140_1icon(title, double valueAmp,
    iconRoute, state){
  Color color;
  Color colorText;
  String on_off;
  if(state){
    color = Colors.lightGreenAccent;
    colorText = Colors.white;
    on_off = "ON";
  }else{
    color = Colors.grey;
    colorText = Colors.grey;
    on_off = "OFF";
  }
  
  return  ClipRect(
    child: Container(
        margin: EdgeInsets.all(7),
        width: 225,
        height: 140,
        decoration: BoxDecoration(
            color: const Color(0xff2d3033)
        ),
        child: Stack(children: [
          // Valvulas (Todas)
          Positioned.fill(  ///titulo
            top: 4,
            left: 8,
            child:   Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: MyTextStyle.estiloBold(18, colorText),
              ),
            ),
          ),
          Positioned.fill(    ///textAbajoIzq
            left: 8,
            bottom: 6,
            child:  Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                on_off,
                style: MyTextStyle.estilo(18, color),
              ),
            ),
          ),
          Positioned.fill(  ///textAbajoDer
            right: 8,
            bottom: 6,
            child:  Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Consumo" + valueAmp.toString() + "A",
                style: MyTextStyle.estilo(18, colorText),
              ),
            ),
          ),
          Positioned.fill(  ///icon
            child:  Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, color, 60),
            ),
          )
        ])
    ),
  );
}


Widget box225x140_add_device(){
  return ClipRect(
    child: Container(
      width: 225,
      height: 140,
        margin: EdgeInsets.all(10),
        child: DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      color: Colors.white,
      child: Container(
            width: 225,
            height: 140,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                        child: Icon(Icons.add,size: 65,color: Colors.white,)
                    )
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("AÑADIR DISPOSITIVO",
                          style: MyTextStyle.estilo(20, Colors.white),)
                    )
                ),
              ],
            ),
      ),
    ),
    ),
  );
}




TextStyle estilo(){
  return TextStyle(
      color:  const Color(0xffffffff),
      fontWeight: FontWeight.w300,
      fontFamily: "Mada",
      fontStyle:  FontStyle.normal,
      fontSize: 15.0
  );
}

TextStyle estiloBold(){
  return TextStyle(
      color:  const Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontFamily: "Mada",
      fontStyle:  FontStyle.normal,
      fontSize: 15.0
  );
}