import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWTemperature extends StatefulWidget {
  bool isAdded;

  WWTemperature(this.isAdded);

  @override
  _WWTemperatureState createState() => _WWTemperatureState();
}

class _WWTemperatureState extends State<WWTemperature> {
  String title = "TEMPERATURAS";

  @override
  Widget build(BuildContext context) {
    return temperature_widget();
  }


  Widget temperature_widget(){
    return InkWell(
      splashColor: MyColors.principal,
      onLongPress: (){
        TabChanger tabChanger =  TabChanger(context);
        tabChanger.changeTab(Constants.PAGE_WHEATER);
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 225,
        height: 140,
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              top: 5,
              child:  Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                    style: MyTextStyle.estiloBold(Constants.TITLE_WW_DIM, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              left: 10,top: 10,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: Text("INTERIOR",
                    style: MyTextStyle.estilo(14, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              right: 10,top: 10,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text("EXTERIOR",
                    style: MyTextStyle.estilo(14, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              left: 25,top: 60,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: Text("25.4" + "ªc",
                    style: MyTextStyle.estiloBold(16, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              right: 25,top: 60,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text("25.4" + "ªc",
                    style: MyTextStyle.estiloBold(16, Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }


}

