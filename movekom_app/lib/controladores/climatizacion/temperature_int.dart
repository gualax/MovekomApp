import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class TemperatureInt extends StatefulWidget {
  int widgetType;
  TemperatureInt(this.widgetType);
  @override
  _TemperatureIntState createState() => _TemperatureIntState();
}

class _TemperatureIntState extends State<TemperatureInt> {
  String title = "INTERIOR";
  @override
  Widget build(BuildContext context) {

    if (widget.widgetType == 1) {
      return temperatura_principal(context,title,"30%","21.5C");
    } else {
      return temp_int();
    }
  }

  Widget temp_int() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 130,
      height: 63,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child:  Align(
              alignment: Alignment.center,
              child: Text("25.5",
                  style: MyTextStyle.estiloBold(22, Colors.white)),
            ),
          ),
          MyPositioned.fill(
            top:8,left: 70,
            child:  Align(
              alignment: Alignment.center,
              child: Text("ºC",
                  style: MyTextStyle.estiloBold(15, Colors.white)),
            ),
          ),
          MyPositioned.fill(
            left: 10,top: 5,
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: MyTextStyle.estiloBold(14, Colors.white)),
            ),
          )
        ],
      ),
    );
  }


  Widget temperatura_principal(context,title, valueHum, valueTemp){
    return
      GestureDetector(
        onTap: (){
          TabChanger tabChanger =  TabChanger(context);
          tabChanger.changeTab(1);
        },
        child: MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 137,
            height: 59.5,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ), child: Stack(
            children: [
              MyPositioned.fill(
                left: 7,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD("assets/images/temperature_1.svg", MyColors.text,35),
                ),
              ),
              // Valvulas (Todas)
              MyPositioned.fill(   /// Texto del medio
                left: 20,
                child:   Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: MyTextStyle.estiloBold(22, MyColors.text),
                                text: valueTemp
                            ),
                          ]
                      )
                  ),
                ),
              ),
              MyPositioned.fill(
                top: 4,
                child:   Align(
                  alignment: Alignment.topCenter,
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style:MyTextStyle.estiloBold(12, MyColors.text),
                                text: title ),
                          ]
                      )
                  ),
                ),
              ),
              // OFF
            ])
        ),
      );
  }
}
