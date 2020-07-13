
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WwWeatherBox extends StatelessWidget {
  bool isAdded;
  String title = "CLIMA";
  WwWeatherBox(this.isAdded);

  @override
  Widget build(BuildContext context) {
    return wheater_widget(context);
  }


  Widget wheater_widget(context){
    return InkWell(
      splashColor: MyColors.principal,
      onLongPress: (){
        TabChanger tabChanger =  TabChanger(context);
        tabChanger.changeTab(Constants.PAGE_WHEATER);
      },
      child: MyContainer(
        width: 225,
        height: 140,
        margin: EdgeInsets.all(SC.all(7)),
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill( /// DAY
                top: 9, left: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "El tiempo hoy" , style: MyTextStyle.estilo(18, Colors.white),),
                )
            ),
            MyPositioned.fill(/// ICON
              child: Align(
                alignment: Alignment.center,
                child:  iconSvgD("assets/icons/clima_sol.svg", Colors.white,45.0), /// icon weather
              ),
            ),
          ],
        ),
      ),
    );
  }
}
