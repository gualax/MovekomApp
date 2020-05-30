

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConf.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
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
  return MyContainer(
      margin: EdgeInsets.only(left: SC.left(7),top: SC.top(3),right:SC.right(7),bottom: SC.bot(3)),
      width: 137,
      height: 64,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ), child: Stack(children: [
    MyPositioned.fill( /// icono
      left: 7,
      top: 15,
      child: Align(
        alignment: Alignment.centerLeft,
        child: iconSvgD(iconRoute, color,27),
      ),
    ),
    MyPositioned.fill( /// titulo
      top: 4,
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estiloBold(12, color),
                      text: title
                  ),
                ]
            )
        ),
      ),
    ),
    MyPositioned.fill( /// valueAh
      top: 15,
      left: 20,
      child: Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style:MyTextStyle.estilo(17, color),
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
