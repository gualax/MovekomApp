import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';

class WarningHistoryView extends StatefulWidget {
  @override
  _WarningHistoryViewState createState() => _WarningHistoryViewState();
}

class _WarningHistoryViewState extends State<WarningHistoryView> {
  @override
  Widget build(BuildContext context) {
    return alertas();
  }



  Widget alertas(){
    return Container(
      margin: EdgeInsets.only(top:15, left:60, right: 60),
      child: ListView(
        children: <Widget>[
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
          historyBox(),
        ],
      ),
    );
  }

  Widget historyBox(){
    return Container(
      margin: EdgeInsets.all(7),
      height: 60,
      width: 1100,
      decoration: new BoxDecoration(
        color: MyColors.ContainerColor,
      ),
    );
  }

}
