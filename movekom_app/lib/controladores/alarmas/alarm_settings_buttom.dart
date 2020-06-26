import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class AlarmSettingsButton extends StatefulWidget {
  @override
  _AlarmSettingsButtonState createState() => _AlarmSettingsButtonState();
}

class _AlarmSettingsButtonState extends State<AlarmSettingsButton> {
  String title = "MAS AJUSTES";
  @override
  Widget build(BuildContext context) {
    return alarm_settings_button();
  }



  Widget alarm_settings_button(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 116,
      width: 137,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:5,left: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                style: MyTextStyle.estilo(15, MyColors.text),
                textAlign: TextAlign.center,),
            ),
          ),
          MyPositioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: iconSvgD("assets/icons/configuracion.svg", MyColors.text, 40),
            ),
          ),
        ],
      ),
    );
  }
}
