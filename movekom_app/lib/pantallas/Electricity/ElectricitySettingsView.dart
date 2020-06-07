
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ElectricitySettingsView extends StatefulWidget {
  @override
  _ElectricitySettingsViewState createState() => _ElectricitySettingsViewState();
}

class _ElectricitySettingsViewState extends State<ElectricitySettingsView> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          voltaje("VOLTAJE MAXIMO","14.2"),
          voltaje("VOLTAJE MINIMO", "11.2"),
        ],
      ),
    );
  }

  Widget voltaje(title,value){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
        width: 268,
        height: 131,
        decoration: BoxDecoration(
            color: MyColors.baseColor
        ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                style: MyTextStyle.estilo(16, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(value + " V",
                  style: MyTextStyle.estilo(26, MyColors.text),),
              )
          ),
        ],
      ),
    );
  }
}