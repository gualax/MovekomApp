import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoAlquiler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return alquiler_wid();
  }


  Widget alquiler_wid(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 83.00,
      width: 190.00,
      color: MyColors.baseColor,
      child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                top: 10,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text("MODO ALQUILER",
                    style: MyTextStyle.estilo(15, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                top:10, left: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ESTADO",
                    style: MyTextStyle.estilo(15, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                left: 10, top:15,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD("assets/icons/alquiler.svg",MyColors.text, 40),
                )
            ),
          ]
      ),
    );
  }

}
