import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'dart:math';

import 'package:movekomapp/responsive_ui/mi_container.dart';

Widget flechaIndicador(angle,dim){
  return Transform.rotate(
    angle:angle ,
    child: Transform.rotate(
      angle:  pi,
      child: MyContainer(
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