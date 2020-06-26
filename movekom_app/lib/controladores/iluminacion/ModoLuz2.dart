import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
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
    title1 = "GUARDAR MODO 2";
    title2 = "MODO 2";

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
      height: 175,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              top: 40,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgNc("assets/icons/save_green.svg",  45),
              )
          ),
          MyPositioned.fill(
              top:5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title1,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.estilo(15, Colors.white), ),
              )
          ),
        ],
      ),
    );
  }


  Widget modo_luz_2(){
    Color colorIcon;
    colorIcon = MyColors.principal;
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
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD("assets/icons/letter_m.svg", colorIcon, 90),
            ),
          ),
          MyPositioned.fill(
            top: 10, left: 10,
            child: Text(title2,
              style:MyTextStyle.estilo(18, MyColors.text))
          ),
          MyPositioned.fill(
            right: 10, top: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: circuloConSombra(15, colorIcon),
            ),
          ),
        ],
      ),
    );
  }
}