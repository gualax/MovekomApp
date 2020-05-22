

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConf.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

Widget box137x64(){
  return Container(
      margin: EdgeInsets.only(left: 7,top: 3,right: 7,bottom: 3),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}






TextStyle estilo(){
  return TextStyle(
      color:  const Color(0xffffffff),
      fontWeight: FontWeight.w300,
      fontFamily: "Mada",
      fontStyle:  FontStyle.normal,
      fontSize: 12.0
  );
}

TextStyle estiloBold() {
  return TextStyle(
      color: const Color(0xffffffff),
      fontWeight: FontWeight.bold,
      fontFamily: "Mada",
      fontStyle: FontStyle.normal,
      fontSize: 15.0
  );
}

Widget  iconSvg(assetName,color) {
  return SvgPicture.asset(
    assetName,
    height: 25,
    width: 25,
    color: color,
  );

}

Widget box137x64_carga(title,iconRoute,valueAh,state){
  Color color;
  if(state){
    color = Colors.lightGreen;
  }else{
    color = Colors.grey;
  }
  return Container(
      margin: EdgeInsets.only(left: SC.left(7),top: SC.top(3),right:SC.right(7),bottom: SC.bot(3)),
      width: SizeConf.wid(137),
      height: SizeConf.hei(64),
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor
      ), child: Stack(children: [
    Positioned.fill( /// icono
      left:SC.left(7),
      top: SC.top(15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: iconSvg(iconRoute, color),
      ),
    ),
    Positioned.fill( /// titulo
      top:SC.top(4),
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estiloBold(SC.all(15), color),
                      text: title
                  ),
                ]
            )
        ),
      ),
    ),
    Positioned.fill( /// valueAh
      top: SC.top(15),
      left: SC.left(20),
      child: Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estilo(SC.all(25), color),
                      text: valueAh
                  ),
                ]
            )
        ),
      ),
    ),
  ])
  );
}
