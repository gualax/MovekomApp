import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

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
          alertBox(),
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
    );
  }

  Widget criticBox(){
    return MyContainer(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
    );
  }

}


