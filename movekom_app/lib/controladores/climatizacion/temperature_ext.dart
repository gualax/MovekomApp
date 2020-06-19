import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class TemperatureExt extends StatefulWidget {

  @override
  _TemperatureExtState createState() => _TemperatureExtState();
}

class _TemperatureExtState extends State<TemperatureExt> {
  String title = "TEMPERATURA EXTERIOR";
  @override
  Widget build(BuildContext context) {
    return temp_ext();
  }

  Widget temp_ext() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 185,
      height: 67,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child:  Align(
              alignment: Alignment.center,
              child: Text("25.5ºC",
                  style: MyTextStyle.estiloBold(30, Colors.white)),
            ),
          ),
          MyPositioned.fill(
            left: 10,top: 5,
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: MyTextStyle.estilo(16, Colors.white)),
            ),
          )
        ],
      ),
    );
  }


}
