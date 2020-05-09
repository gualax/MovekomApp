import 'package:flutter/material.dart';
import 'dart:math';

Widget flechaIndicador(angle,dim){
  return Transform.rotate(
    angle:angle ,
    child: Transform.rotate(
      angle:  pi,
      child: Container(
        height: dim,
          width: dim,
          //margin: EdgeInsets.all(dim),
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/indicador_calefa.png"),
              fit: BoxFit.contain,
            ),
          )
      ),
    ),
  );
}