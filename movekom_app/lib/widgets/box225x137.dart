

import 'package:flutter/material.dart';

Widget box225x137(title, textAbajoIzq, textAbajoDer, textArribaDer){
  return  Container(
      margin: EdgeInsets.all(7),
      width: 225,
      height: 137,
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