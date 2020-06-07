import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';

class MyTextStyle {


  static TextStyle estilo(double dim,color){
    return TextStyle(
        color:  color,
        fontWeight: FontWeight.w300,
        fontFamily: "Mada",
        fontStyle:  FontStyle.normal,
        fontSize: SC.all(dim)
    );
  }

  static TextStyle estiloBold(double dim,color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: "Mada",
        fontStyle: FontStyle.normal,
        fontSize: SC.all(dim),
    );
  }
  static TextStyle estiloBox(double dim,color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: "Mada",
        fontStyle: FontStyle.normal,
        fontSize: SC.all(dim)
    );
  }



}

