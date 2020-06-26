

import 'package:flutter/material.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'DrawCircle.dart';
import 'MyColors.dart';
import 'SC.dart';

Widget circuloConSombra(dim,color){
  return Container(
      width: SC.wid(dim),
      height: SC.hei(dim),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color:color,
        boxShadow: [BoxShadow(
            color: color,
            offset: Offset(0,0),
            blurRadius: 10,
            spreadRadius: 0
        ) ],
      )
  );
}

Widget circulo(dim,color,state){
  return Container(
      width: dim,
      height: dim,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color:color,
      )
  );
}


Widget circulito(size, color){
  //this is base circle
  return Container(
    child: CustomPaint(painter: DrawCircle(size,color,PaintingStyle.stroke,1.0) ),
  );
}


Widget circleIndicator(value, color){
  return CircularPercentIndicator(
    radius: 78.0,
    lineWidth: 8,
    percent: (value)/100,
    center: new Text((value).toString() +"%",
      style: MyTextStyle.estiloBold(20, Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}

Widget circleIndicatorBateria(value, color,dim,valueVolt){
  return CircularPercentIndicator(
    radius: dim,
    lineWidth: SC.all(10),
    percent: (value)/100,
    center: Stack(
      children: <Widget>[
        MyPositioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.center,
            child: Text(valueVolt ,
                style: MyTextStyle.estiloBold(40, Colors.white,)),
          ),),
        MyPositioned.fill(
          top: 30,
          child: Align(
            alignment: Alignment.center,
            child:Text("VOLT" ,
                style: MyTextStyle.estilo(15, Colors.white,)),
          ),),
      ],
    ),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}



Widget circleIndicatorBateriaAux(value, color,dim,valueVolt){
  return CircularPercentIndicator(
    radius: dim,
    lineWidth: SC.all(15),
    percent: (value)/100,
    center: Stack(
      children: <Widget>[
        MyPositioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.center,
            child: Text(valueVolt ,
              style: MyTextStyle.estiloBold(40, Colors.white,)),
        ),),
        MyPositioned.fill(
          top: 50,
          child: Align(
            alignment: Alignment.center,
          child:Text("VOLT" ,
              style: MyTextStyle.estilo(27, Colors.white,)),
        ),),
      ],
    ),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}



Widget circleIndicator_big(value, color){
  return CircularPercentIndicator(
    radius: 105.0,
    lineWidth: 12,
    percent: (value)/100,
    center: new Text((value).toString() +"%",
      style: MyTextStyle.estiloBold(25, Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}


Widget indicadorCircularLleno(value, color,radius){
  return CircularPercentIndicator(
    radius: radius,
    lineWidth: SC.all(12),
    percent: (value)/100,
    center: new Text((value).toString() +"%",
      style: MyTextStyle.estiloBold(25, Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}

