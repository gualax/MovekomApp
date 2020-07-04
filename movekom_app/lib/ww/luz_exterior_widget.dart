import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class LuzExtWW extends StatefulWidget {
  @override
  _LuzExtWWState createState() => _LuzExtWWState();
}

class _LuzExtWWState extends State<LuzExtWW> {
  @override
  Widget build(BuildContext context) {
    return luz_ext_ww();
  }


  Widget luz_ext_ww(){
    String on_off = "OFF";
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 66,
      height: 140,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
            child:  Align(
              alignment: Alignment.topCenter,
              child: iconSvgD("assets/icons/lampara.svg",MyColors.text, 30),
            ),
          ),
          MyPositioned.fill(
            child:  Align(
              alignment: Alignment.center,
              child: iconSvgD("assets/icons/park.svg", MyColors.text, 40),
            ),
          ),
          MyPositioned.fill(
            bottom: 10,
            child:  Align(
              alignment: Alignment.bottomCenter,
              child: Text(on_off,
                  style: MyTextStyle.estilo(14, MyColors.text)),
            ),
          ),
        ],
      ),
    );
  }
}
