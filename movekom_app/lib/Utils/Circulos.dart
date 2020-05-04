

import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'DrawCircle.dart';
import 'MyColors.dart';

Widget circuloConSombra(dim,color){
  return Container(
      width: dim,
      height: dim,
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
    backgroundColor: MyColors.ContainerColor,
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
    backgroundColor: MyColors.ContainerColor,
  );
}

