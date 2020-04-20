import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget  iconSvgD(assetName,color,double dim){
  return  SvgPicture.asset(
    assetName,
    height: dim,
    width: dim,
    color: color,
  );

}



Widget  iconSvgNc(assetName,double dim){
  return  SvgPicture.asset(
    assetName,
    height: dim,
    width: dim,
  );

}