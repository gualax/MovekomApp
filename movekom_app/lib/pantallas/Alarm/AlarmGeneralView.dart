


import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/alarmas/alarm_settings_buttom.dart';
import 'package:movekomapp/controladores/alarmas/alarma.dart';
import 'package:movekomapp/controladores/alarmas/luz_perimetro.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class AlarmMenuPage extends StatefulWidget {
  @override
  _AlarmMenuPageState createState() => _AlarmMenuPageState();
}

class _AlarmMenuPageState extends State<AlarmMenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

