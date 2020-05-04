

import 'package:flutter/cupertino.dart';

Widget amperimetroImg(int valueAh,dim){
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
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/amperimetro/amp_sa_$numberStr.png"),
          fit: BoxFit.contain,
        ),
      )
  );
}


