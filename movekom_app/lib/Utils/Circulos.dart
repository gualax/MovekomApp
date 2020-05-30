

import 'package:flutter/material.dart';
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

Widget circleIndicatorBateria(value, color,dim){
  return CircularPercentIndicator(
    radius: dim,
    lineWidth: 8,
    percent: (value)/100,
    center: new Text("14.2" ,
      style: MyTextStyle.estiloBold(20, Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}



Widget circleIndicatorBateriaAux(value, color,dim,valueVolt){
  return CircularPercentIndicator(
    radius: dim,
    lineWidth: 15,
    percent: (value)/100,
    center: new Text(valueVolt ,
      style: MyTextStyle.estiloBold(40, Colors.white)),
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
    lineWidth: 12,
    percent: (value)/100,
    center: new Text((value).toString() +"%",
      style: MyTextStyle.estiloBold(25, Colors.white),),
    progressColor: color,
    backgroundColor: MyColors.baseColor,
  );
}

