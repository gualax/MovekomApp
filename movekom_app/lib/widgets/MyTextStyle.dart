import 'package:flutter/material.dart';

class MyTextStyle {


  static TextStyle estilo(double dim,color){
    return TextStyle(
        color:  color,
        fontWeight: FontWeight.w300,
        fontFamily: "Mada",
        fontStyle:  FontStyle.normal,
        fontSize: dim
    );
  }

  static TextStyle estiloBold(double dim,color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: "Mada",
        fontStyle: FontStyle.normal,
        fontSize: dim
    );
  }

}

