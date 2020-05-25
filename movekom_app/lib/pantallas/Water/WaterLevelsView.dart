import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasNegras.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'WaterBoilerView.dart';


class WaterLevelsView extends StatefulWidget {
  @override
  _WaterLevelsViewState createState() => _WaterLevelsViewState();
}

class _WaterLevelsViewState extends State<WaterLevelsView> {
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return MyContainer(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   // color: Colors.orange,
                    children: <Widget>[
                     aguas(),
                      WaterBoilerView(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }


  Widget aguas(){
    return MyContainer(
    //  color: Colors.purpleAccent,
      margin: EdgeInsets.only(right: SC.right(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RowOfWaterTanks1(),
          RowOfWaterTanks2(),
        ],
      ),
    );
  }



  Widget RowOfWaterTanks2(){
    return Container(
 //     color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AguasNegras(2),
          BombaAgua(2),
      //    AguasNegras(3),
        ],
      ),
    );
  }


  Widget RowOfWaterTanks1(){
    return Container(
      //     color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AguasLimpias(2),
          AguasSucias(2),
          //    AguasNegras(3),
        ],
      ),
    );
  }


  Widget WaterValve(title){
  return
  Container(
  margin: EdgeInsets.all(10),
  width: 200,
  height: 200,
  decoration: new BoxDecoration(
  color: Color(0xff2d3033)
  ), child: Stack(
      children: <Widget>[
        Positioned.fill(   /// Titulo
          top:4,
          child:   Align(
            alignment: Alignment.topCenter,
            child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          style: MyTextStyle.estiloBold(15, Colors.white),
                          text: title
                      ),
                    ]
                )
            ),
          ),
        ),
        Positioned.fill(   /// Titulo
          child:   Align(
            alignment: Alignment.center,
            child: iconSvgD("assets/icons/valvula.svg", Colors.white, 80)
          ),
        ),
      ],
  )
  );
}
}

