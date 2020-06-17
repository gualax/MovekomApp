import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/SC.dart';

Widget  iconSvgD(assetName,color,double dim){
  return  SvgPicture.asset(
    assetName,
    height: SC.hei(dim),
    width:  SC.wid(dim),
    color: color,
  );

}



Widget  iconSvgNc(assetName,double dim){
  return  SvgPicture.asset(
    assetName,
    height: SC.hei(dim),
    width: SC.wid(dim),
  );

}