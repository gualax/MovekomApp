import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';



class ModoLuz2 extends StatelessWidget {
  String title1;
  String title2;
final int widgetType;

  ModoLuz2(this.widgetType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    title1 = "Guardar modo 2";
    title2 = "Modo 2";

    if(widgetType  == 1){
      return save_modo_luz_2();
    }else{
      return modo_luz_2();
    }
  }

  Widget save_modo_luz_2(){

    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 98,
      height: 103,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              bottom: 8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: iconSvgNc("assets/icons/save_green.svg",  45),
              )
          ),
          MyPositioned.fill(
              top:5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title1,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.estiloBold(15, Colors.white), ),
              )
          ),
        ],
      ),
    );
  }


  Widget modo_luz_2(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 160,
      height: 175,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: [
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD("assets/icons/letter_m.svg", Colors.grey, 70),
            ),
          ),
          MyPositioned.fill(
            top: 10, left: 10,
            child: Text(title2,
              style:MyTextStyle.estiloBold(20, MyColors.text))
          ),
        ],
      ),
    );
  }
}