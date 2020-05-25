import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class AmperimetroGeneral extends StatelessWidget {
  String title = "Amperimetro general";
  @override
  Widget build(BuildContext context) {
    return amperimetro_general();
  }



  Widget amperimetro_general(){
    return MyContainer(
      margin: EdgeInsets.all(5),
      width: 410,
      height: 214,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:80,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "Ah", style: MyTextStyle.estiloBold(28, MyColors.textColor)),
            ),
          ),
          MyPositioned.fill(
            top:5,
            left: 10,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  title, style: MyTextStyle.estiloBold(20, MyColors.textColor)),
            ),
          ),
          MyPositioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/rayo_lleno_img.png",),
            ),
          ),
          MyPositioned.fill(
            right: 10,
            bottom: 10,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "40", style: MyTextStyle.estiloBold(80, MyColors.textColor)),
            ),
          ),
        ],
      ),
    );
  }

}
