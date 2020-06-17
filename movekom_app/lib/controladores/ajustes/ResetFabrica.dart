import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Reset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return reset_wid();
  }


  Widget reset_wid(){
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
                  child: Text("RESET FABRICA",
                    style: MyTextStyle.estilo(15, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                top:10, left: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Pulsar para reset",
                    style: MyTextStyle.estilo(15, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                left: 10, top:15,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgNc("assets/icons/reset.svg", 40),
                )
            ),
          ]
      ),
    );
  }

}
