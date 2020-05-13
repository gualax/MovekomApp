import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:movekomapp/Utils/MyColors.dart';

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
    return Container(
      margin: EdgeInsets.all(10),
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
    return Container(
      height: 100,
      width: 900,
      decoration: new BoxDecoration(
          color: MyColors.ContainerColor,
      ),
    );
  }

  Widget deleteBox(){
    return Container(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.ContainerColor,
      ),
    );
  }

  Widget criticBox(){
    return Container(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.ContainerColor,
      ),
    );
  }

}


