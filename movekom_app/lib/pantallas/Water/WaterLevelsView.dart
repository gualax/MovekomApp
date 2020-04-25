import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import '../../app.localizations.dart';


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
              //      color: Colors.orange,
                    child: aguas(),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                   // color: Colors.blue,
                   child: WaterBomb(context, "2.65A", true),
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
          WaterTank("AGUAS LIMPIAS","80",true),
          WaterTank("AGUAS SUCIAS","70",true),
          WaterTank("AGUAS NEGRAS","50",false),
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
          WaterValve("AGUAS LIMPIAS"),
          WaterValve("AGUAS SUCIAS"),
          WaterValve("AGUAS NEGRAS"),
        ],
      ),
    );
  }



  Widget WaterTank(title,value,state){
    return
      Container(
          margin: EdgeInsets.all(10),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
              color: Color(0xff2d3033)
          ), child: Stack(
          children: [
            Positioned.fill( /// Circulo
              top: 25,
              child: Align(
                alignment: Alignment.center,
                child: circulito2(65.0, Colors.blueGrey),
              ),
            ),
            // Valvulas (Todas)
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
            Positioned.fill(   /// value
              top: 25,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(45, Colors.white),
                              text: value
                          ),
                        ]
                    )
                ),
              ),
            ),
          ])
      );
  }

  Widget WaterBomb(context, txtAmp, bool state) {

    Color colorState;
    String txtState;
    if (state) {
      txtState = "ON";
      colorState = Colors.lightGreen;
    } else {
      txtState = "OFF";
      colorState = Colors.grey;
    }
    return
      Container(
          margin: EdgeInsets.only(right: 150),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
              color: Color(0xff2d3033)
          ),
          child: Stack(
              children: [
                Positioned.fill(
                  /// Switch
                  top: 20,
                  right: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: _switch(state, colorState),
                  ),
                ),
                Positioned.fill(
                  /// Icono
                  left: 12,
                  top: 20,
                  child: Align(
                    alignment: Alignment.center,
                    child: iconSvgD(
                        "assets/images/water_1.svg", colorState, 95),
                  ),
                ),
                // Valvulas (Todas)
                Positioned.fill(
                  /// Titulo
                  top: 4,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  style: MyTextStyle.estiloBold(
                                      17, Colors.white),
                                  text: AppLocalizations.of(context).translate(
                                      "bomba_de_agua")),
                            ]
                        )
                    ),
                  ),
                ),
                Positioned.fill(
                  /// OFF / ON
                  left: 10,
                  bottom: 4,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  style: MyTextStyle.estilo(16, colorState),
                                  text: txtState),
                            ]
                        )
                    ),
                  ),
                ),
                Positioned.fill(
                  /// amp
                  right: 10,
                  bottom: 4,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  style: MyTextStyle.estilo(16, Colors.white),
                                  text: txtAmp),
                            ]
                        )
                    ),
                  ),
                ),
              ])
      );
  }

  Widget _switch(value,color){
    return Switch(
        value:value,
        activeColor: color,
        onChanged: (bool state){
          print(state);
        }
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
