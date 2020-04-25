

import 'package:flutter/material.dart';

import 'DrawCircle.dart';

Widget circuloConSombra(dim,color,state){
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
