import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasNegras.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WaterLevelsView extends StatefulWidget {
  @override
  _WaterLevelsViewState createState() => _WaterLevelsViewState();
}

class _WaterLevelsViewState extends State<WaterLevelsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                   // color: Colors.orange,
                    child: aguas(),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
               //     color: Colors.blue,
                   child: BombaAgua(2),
                  ),
                )
              ],
            ),
    );
  }


  Widget aguas(){
    return Container(
    //  color: Colors.purpleAccent,
      margin: EdgeInsets.only(left: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RowOfWaterTanks(),
          RowOfWaterValves(),
        ],
      ),
    );
  }




  Widget RowOfWaterTanks(){
    return Container(
 //     color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AguasLimpias(2),
          AguasSucias(2),
          AguasNegras(2),
        ],
      ),
    );
  }

  Widget RowOfWaterValves(){
    return Container(
 //     color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AguasLimpias(3),
          AguasSucias(3),
          AguasNegras(3),
        ],
      ),
    );
  }






  Widget circulito2(size, color){
    //this is base circle
    return Container(
      child: CustomPaint(painter: DrawCircle(size,color,PaintingStyle.stroke,3.0) ),
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
