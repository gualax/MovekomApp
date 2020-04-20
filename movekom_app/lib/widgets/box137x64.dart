

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

Widget box137x64(){
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}


Widget box137x64_params(title, textAbajoIzq, textAbajoDer, textArribaDer){
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ), child: Stack(children: [
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
      start: 10,
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


Widget box137x64_icon(title, textAbajoIzq, textAbajoDer, textArribaDer,iconRoute){
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ), child: Stack(children: [
    // Valvulas (Todas)
    Positioned.fill(
      left: 10,
      child: Align(
        alignment: Alignment.centerLeft,
        child: iconSvg(iconRoute, Colors.white),
      ),
    ),
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
      start: 10,
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
      fontSize: 12.0
  );
}

TextStyle estiloBold() {
  return TextStyle(
      color: const Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontFamily: "Mada",
      fontStyle: FontStyle.normal,
      fontSize: 15.0
  );
}

Widget  iconSvg(assetName,color) {
  return SvgPicture.asset(
    assetName,
    height: 25,
    width: 25,
    color: color,
  );

}

Widget box137x64_carga(title,iconRoute,valueAh,state){
  Color color;
  if(state){
    color = Colors.lightGreen;
  }else{
    color = Colors.grey;
  }
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ), child: Stack(children: [
    Positioned.fill( /// icono
      left: 7,
      top: 15,
      child: Align(
        alignment: Alignment.centerLeft,
        child: iconSvg(iconRoute, color),
      ),
    ),
    Positioned.fill( /// titulo
      top:4,
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estiloBold(15, color),
                      text: title
                  ),
                ]
            )
        ),
      ),
    ),
    Positioned.fill( /// valueAh
      top: 15,
      left: 20,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estilo(25, color),
                      text: valueAh
                  ),
                ]
            )
        ),
      ),
    ),
  ])
  );
}

Widget box137x64_Tiempo_uso(title,valueAh,state){
  Color color;
  if(state){
    color = Colors.white;
  }else{
    color = Colors.grey;
  }
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ), child: Stack(children: [
    Positioned.fill( /// titulo
      top:4,
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estiloBold(15, color),
                      text: title
                  ),
                ]
            )
        ),
      ),
    ),
    Positioned.fill( /// valueAh
      top: 15,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estilo(25, color),
                      text: valueAh
                  ),
                ]
            )
        ),
      ),
    ),
  ])
  );
}