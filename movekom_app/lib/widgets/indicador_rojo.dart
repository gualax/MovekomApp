import 'package:flutter/material.dart';

Widget inidicadorRojoImg(int valueAh,dim){
  double index;
  String numberStr;
  switch(valueAh){
    case 0:
      index = 0;
      break;
    default:
      index = valueAh/10;
      break;
  }
  numberStr = index.truncate().toString();
  print(numberStr);
  return Container(
    margin: EdgeInsets.all(dim),
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/indicadores/indicador_rojo$numberStr.png"),
          fit: BoxFit.contain,
        ),
      )
  );
}