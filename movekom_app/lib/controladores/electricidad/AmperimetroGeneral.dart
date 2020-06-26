import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class AmperimetroGeneral extends StatelessWidget {
  String title = "TOTALIZADOR";
  @override
  Widget build(BuildContext context) {
    return amperimetro_general();
  }



  Widget amperimetro_general(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 410,
      height: 204,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:20,right: 65,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                  "A", style: MyTextStyle.estiloBold(25, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            top:5,
            left: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  title, style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: img_rayito(SC.all(120)),
            ),
          ),
          MyPositioned.fill(
            left: 40,
            bottom: 10,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "+54.4", style: MyTextStyle.estiloBold(70, MyColors.text)),
            ),
          ),
        ],
      ),
    );
  }


Widget img_rayito(dim){
  return MyContainer(
    height: dim,
      width: dim,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/rayo_lleno_img.png"),
          fit: BoxFit.contain,
        ),
      )
  );
}

}
