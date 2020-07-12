import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/controladores/averias/averiasHistory.dart';

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
          AveriasHistory(title: "AVERIA CALEFACTOR F12",),
          AveriasHistory(title: "BAJO VOLTAJE EN BATERIA 1",),
          AveriasHistory(title: "ALTO VOLTAJE EN BATERIA 2",),
          AveriasHistory(title: "BOILER DESCONECTADO",),
        ],
      ),
    );
  }



}
