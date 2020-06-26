


import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/alarmas/change_desconection_pin.dart';
import 'package:movekomapp/controladores/alarmas/retard_time_widget.dart';

class AlarmSettingsView extends StatefulWidget {
  @override
  _AlarmSettingsViewState createState() => _AlarmSettingsViewState();
}

class _AlarmSettingsViewState extends State<AlarmSettingsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.only(bottom: SC.bot(100)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ChangeDesconectionPin(),
              RetardTimeWidget()
            ],
          ),
        ),
      ),
    );
  }

}