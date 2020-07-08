import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/controladores/agua/Resistencia1.dart';
import 'package:movekomapp/controladores/agua/Resistencia2.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/temporizador_popup.dart';
import 'package:movekomapp/widgets/temporizador_programable.dart';

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
                   crossAxisAlignment: CrossAxisAlignment.center,
                   // color: Colors.orange,
                    children: <Widget>[
                     aguas(),
                     boilerColumn(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget boilerColumn(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WaterBoilerView(),
        row(),
      ],
    );
  }
//720
  Widget row(){
    return Row(
      children: <Widget>[
        temporizador(),
        Resistencia1(),
        Resistencia2(),
      ],
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          invisible(),
          BombaAgua(2),
        ],
      ),
    );
  }

  Widget invisible(){
  return MyContainer(
    margin: EdgeInsets.all(SC.all(7)),
    width: 200,
    height: 210,
    );
  }

  Widget temporizador(){
    return MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        width: 350,
        height: 90,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
      child: Stack(
        children: <Widget>[
         MyPositioned.fill(
           bottom: 20,
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.access_time),
              iconSize: SC.all(40),
              color: MyColors.text,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => TemporizadorProg(),
                );
              },
            ),
          )
      ),
          MyPositioned.fill(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Establecer temporizador",
                  style: MyTextStyle.estilo(16, MyColors.text) ,),
              )
          ),
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

