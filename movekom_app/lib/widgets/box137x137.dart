
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/aguas.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../app.localizations.dart';

Widget box137x137(){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        )
    );
}


Widget box137x137_parms(title, textAbajoIzq, textAbajoDer, textArribaDer){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
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
          ),
        ])
    );
}


Widget box137x137_icon(title,
    textAbajoIzq, textAbajoDer,
    textArribaDer,iconRoute){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, Colors.white,80),
            ),
          ),
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

Widget box137x137_icon_switch(title,
    textAbajoIzq, textAbajoDer,
    textArribaDer,iconRoute){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill(
            top: 15,
              child: Align(
                alignment: Alignment.topRight,
                child: _switch(false,Colors.white),
              ),
          ),
          Positioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD(iconRoute, Colors.white,60),
            ),
          ),
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



Widget box137x137_Temperatura(context,title, valueHum, valueTemp){
  return
    MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        width: 137,
        height: 62,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ), child: Stack(
        children: [
          MyPositioned.fill(
            left: 7,
            child: Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD("assets/images/temperature_1.svg", MyColors.text,35),
            ),
          ),
          // Valvulas (Todas)
          MyPositioned.fill(   /// Texto del medio
              left: 20,
              child:   Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(22, MyColors.text),
                              text: valueTemp
                          ),
                        ]
                    )
                ),
              ),
          ),
          MyPositioned.fill(
            top: 4,
            child:   Align(
              alignment: Alignment.topCenter,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style:MyTextStyle.estiloBold(12, MyColors.text),
                            text: title ),
                      ]
                  )
              ),
            ),
          ),
          // OFF
        ])
    );
}

Widget box137x137_Pronostico(context, iconRoute){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, Colors.white,60),
            ),
          ),
          // Valvulas (Todas)
          Positioned.fill(   /// Texto del medio
            top:4,
            child:   Align(
              alignment: Alignment.topCenter,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: MyTextStyle.estiloBold(15, Colors.white),
                            text: "PRONOSTICO"
                        ),
                      ]
                  )
              ),
            ),
          ),
        ])
    );
}

Widget box137x137_Fecha_Hora(context,txtDia,txtHora){
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
                            style: MyTextStyle.estilo(15, Colors.white),
                            text: txtDia,
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
                          text: txtHora,
                        ),
                      ]
                  )
              ),
            ),
          ),
        ])
    );
}

Widget box137x137_Bomba_Agua(context, txtAmp, bool state){
  Color colorState;
  String txtState;
  if(state){
    txtState = "ON";
    colorState = Colors.lightGreen;
  }else{
    txtState = "OFF";
    colorState = Colors.grey;
  }
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill(  /// Switch
            top: 15,
            child: Align(
              alignment: Alignment.topRight,
              child: _switch(state,colorState),
            ),
          ),
          Positioned.fill( /// Icono
            left: 12,
            child: Align(
              alignment: Alignment.centerLeft,
              child: iconSvgD("assets/images/water_1.svg",colorState,60),
            ),
          ),
          // Valvulas (Todas)
          Positioned.fill( /// Titulo
            top: 4,
            child: Align(
              alignment: Alignment.topCenter,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: MyTextStyle.estiloBold(15, Colors.white),
                            text: AppLocalizations.of(context).translate("bomba_de_agua")),
                      ]
                  )
              ),
            ),
          ),
          Positioned.fill( /// OFF / ON
            left: 10,
            bottom: 4,
            child:  Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: MyTextStyle.estilo(16, colorState),
                            text: txtState),
                      ]
                  )
              ),
            ),
          ),
          Positioned.fill( /// amp
            right: 10,
            bottom: 4,
            child:  Align(
              alignment: Alignment.bottomRight,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: MyTextStyle.estilo(16, colorState),
                            text: txtAmp),
                      ]
                  )
              ),
            ),
          ),
        ])
    );
}

Widget box137x137_Bateria(title,double valueBat, valueVolt,valueAmp,state){
 Color color;
  if(state){
   color = Colors.lightGreen;
  }else{
    color = Colors.grey;
  }
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill(   /// valor bateria
            left: 5,
            child:   Align(
              alignment: Alignment.center,
              child: circleIndicatorBatery(valueBat,color),
            ),
          ),
          Positioned.fill(  /// titulo
            top: 4,
            child:   Align(
              alignment: Alignment.topCenter,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style:MyTextStyle.estiloBold(15, color),
                            text: title ),
                      ]
                  )
              ),
            ),
          ),
          PositionedDirectional( /// valueVolt
            bottom: 4,
            start: 10,
            child:   Text(
                valueVolt,
                style: MyTextStyle.estilo(15, color),
                textAlign: TextAlign.center
            ),
          ),
          PositionedDirectional(  ///  /// valueAmp
              bottom: 4,
              end: 10,
              child:   Text(
                  valueAmp,
                  style: MyTextStyle.estilo(15, color),
                  textAlign: TextAlign.center
              )
          )
        ])
    );
}


Widget box137x137_Aguas(title,value,state){
  return
    Container(
        margin: EdgeInsets.all(7),
        width: 137,
        height: 137,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ), child: Stack(
        children: [
          Positioned.fill( /// Circulo
            top: 30,
            bottom: 10,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.center,
              child: agua_limpia_Img(50),
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
                            text: title
                        ),
                      ]
                  )
              ),
            ),
          ),
          Positioned.fill(   /// value
            top: 25,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: MyTextStyle.estiloBold(25, Colors.white),
                            text: value
                        ),
                      ]
                  )
              ),
            ),
          ),
        ])
    );
}



Widget circulito(size, color){
  //this is base circle
  return Container(
    child: CustomPaint(painter: DrawCircle(size,color,PaintingStyle.stroke,1.0) ),
  );
}



Widget circleIndicatorBatery(value,color){
  return Container (
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        circulito(42.0,color),
        circleIndicator(value, color)
      ],
    ),
  );
}

Widget circleIndicator(value, color){
  return CircularPercentIndicator(
    radius: 78.0,
    lineWidth: 8,
    percent: (value)/100,
    center: new Text((value).toString() +"%",
      style: MyTextStyle.estiloBold(SC.all(20), Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}

Widget _switch(value,color){
  return Switch(
      value:value,
      activeColor: color,
    onChanged: (bool state){
        print(state);
    }
  );
}


Widget box_imagen(title, textAbajoIzq, int valueAmp){
  return
    Container(
        margin: EdgeInsets.all(SC.all(7)),
        width: SC.wid(137), height: SC.hei(137),
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ), child: Stack(
        children: [
          // Valvulas (Todas)
          PositionedDirectional(
            top: SC.top(4), start: 10,
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
            bottom: SC.bot(4), start: 10,
            child:   Text(
                textAbajoIzq,
                style: estilo(),
                textAlign: TextAlign.center
            ),
          ),
          // 2.65 A
          Positioned.fill(
            left: SC.left(10), right: SC.right(10),
            child:  Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/amperimetro/amp_sa_2.png"),
                      fit: BoxFit.contain,
                    ),
                  )
              ),
            ),
          ),
          Positioned.fill(
            top: SC.top(35),
            left: SC.left(10),
            child:  Align(
              alignment: Alignment.center,
              child:Text(valueAmp.toString() +"Ah",
                style: MyTextStyle.estiloBold(SC.all(30), Colors.white) ,),
            ),
          ),
        ])
    );
}

