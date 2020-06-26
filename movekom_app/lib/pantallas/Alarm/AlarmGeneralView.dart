


import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/alarmas/alarm_settings_buttom.dart';
import 'package:movekomapp/controladores/alarmas/alarma.dart';
import 'package:movekomapp/controladores/alarmas/luz_perimetro.dart';

class AlarmGeneralView extends StatefulWidget {
  @override
  _AlarmGeneralViewState createState() => _AlarmGeneralViewState();
}

class _AlarmGeneralViewState extends State<AlarmGeneralView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        // color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Alarma(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LuzPerimetro(),
                    AlarmSettingsButton(),
                  ],
                )
              ],
          )
      ),
    );
  }


}

