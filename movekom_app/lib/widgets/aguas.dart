

import 'package:flutter/cupertino.dart';

Widget agua_limpia_Img(int porcent){
  String routeImg;
  if(porcent == 0){
    routeImg = "assets/images/aguas/agua0.png";
  }else {
    routeImg = "assets/images/aguas/agua_limpia$porcent.png";
  }
  return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(routeImg),
          fit: BoxFit.contain,
        ),
      )
  );
}


Widget agua_sucia_Img(int porcent){
  String routeImg;
  if(porcent == 0){
    routeImg = "assets/images/aguas/agua0.png";
  }else {
    routeImg = "assets/images/aguas/agua_gris$porcent.png";
  }
  return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(routeImg),
          fit: BoxFit.contain,
        ),
      )
  );
}

Widget agua_negra_Img(int porcent){
  String routeImg;
  if(porcent == 0){
    routeImg = "assets/images/aguas/agua0.png";
  }else {
    routeImg = "assets/images/aguas/agua_negra$porcent.png";
  }
  return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(routeImg),
          fit: BoxFit.contain,
        ),
      )
  );
}