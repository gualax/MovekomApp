import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/averias/averias.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WarningAlarmsView extends StatefulWidget {
  @override
  _WarningAlarmsViewState createState() => _WarningAlarmsViewState();
}

class _WarningAlarmsViewState extends State<WarningAlarmsView> {
  @override
  Widget build(BuildContext context) {
    return alertas();
  }


  Widget alertas(){
    return Container(
      child: ListView(
        children: <Widget>[
          alertRow(),
          alertRow(),
          alertRow(),
          alertRow(),
          alertRow(),
          alertRow(),
          alertRow(),
        ],
      ),
    );
  }

  Widget alertRow(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Averia(),
          criticBox(),
          deleteBox(),
        ],
      ),
    );
  }

  Widget alertBox(){
    return MyContainer(
      height: 100,
      width: 900,
      decoration: new BoxDecoration(
          color: MyColors.baseColor,
      ),
    );
  }

  Widget deleteBox(){
    return MyContainer(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("BORRA",
                  style:MyTextStyle.estiloBold(18, MyColors.text)),
              ),
          ),
          MyPositioned.fill(
            top: 25,
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD("assets/icons/eraser.svg", MyColors.text,40),
            ),
          ),
        ],
      ),
    );
  }

  Widget criticBox(){
    return MyContainer(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("CRITIC",
                  style:MyTextStyle.estiloBold(18, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            top: 25,
            child: Align(
              alignment: Alignment.center,
              child:  Text("SI",
                  style:MyTextStyle.estiloBold(18, MyColors.text)
            ),
          ),
          ),
        ],
      ),

    );
  }

}


