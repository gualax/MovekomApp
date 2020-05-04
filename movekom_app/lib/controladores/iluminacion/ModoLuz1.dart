import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';



class ModoLuz1 extends StatelessWidget {
  String title1;
  String title2;
final int widgetType;

ModoLuz1(this.widgetType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    title1 = "Guardar modo de luz 1";
    title2 = "Modo 1";
    if(widgetType == 1){
      return save_modo_luz_1();
    }else{
      return modo_luz_1();
    }

  }

  Widget save_modo_luz_1(){
    return Container(
      margin: EdgeInsets.all(SizeConfig.all(1)),
      width: SizeConfig.x(7.5),
      height: SizeConfig.y(20),
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: SizeConfig.y(6),
              child: Align(
                alignment: Alignment.center,
                child: iconSvgNc("assets/icons/save_disk.svg",  SizeConfig.all(5)),
              )
          ),
          Positioned.fill(
              top: SizeConfig.y(0.5), left: SizeConfig.x(0.5), right:  SizeConfig.x(0.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title1,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.estiloBold(SizeConfig.y(2.2), Colors.white), ),
              )
          ),
        ],
      ),
    );
  }




  Widget modo_luz_1(){
          return Container(
            margin: EdgeInsets.all(SizeConfig.h * 0.5),
            width: SizeConfig.h * 17,
            height: SizeConfig.v * 19,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  right: SizeConfig.h * 3.5, bottom: SizeConfig.v * 0.5,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/letter_m.svg", Colors.grey, 70),
                  ),
                ),
                Positioned.fill(
                  left: SizeConfig.h * 3.5, bottom: SizeConfig.v * 0.5,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.grey, 50),
                  ),
                ),
                PositionedDirectional(
                  top: SizeConfig.v * 0.5,
                  start: SizeConfig.h * 1,
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: MyTextStyle.estiloBold(SizeConfig.v * 2.6, Colors.white),
                                text: title2),
                          ]
                      )
                  ),
                ),
              ],
            ),
          );
  }
}