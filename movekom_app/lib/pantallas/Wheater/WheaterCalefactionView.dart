import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterCalefactionView extends StatefulWidget {
  @override
  _WheaterCalefactionViewState createState() => _WheaterCalefactionViewState();
}

class _WheaterCalefactionViewState extends State<WheaterCalefactionView> {
  @override
  Widget build(BuildContext context) {
    return contenido();
  }



  Widget contenido() {
    return Container(
        margin: EdgeInsets.only(top: 50),
        // color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Calefaccion2(2),
            container(),
          ],
        ),
    );
  }




  Widget container() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 462,
      height: 388,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  box165x67(),
                  box165x67(),
                ],
              ),
              box247x144(),
            ],
          ),
          Extractor(),
          bar(),
        ],
      ),

    );
  }


  Widget box247x144() {
    return Container(
      margin: EdgeInsets.only(left: 5, bottom: 6),
      width: 247,
      height: 144,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD("assets/icons/sol_nubes.svg", Colors.white, 60),
              ),
            ),
            // Valvulas (Todas)
            Positioned.fill(

              /// Texto del medio
              top: 4,
              child: Align(
                alignment: Alignment.topCenter,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(15, Colors.white),
                              text: "PRONOSTICO"
                          ),
                        ]
                    )
                ),
              ),
            ),
          ]),
    );
  }

  Widget box165x67() {
    return Container(
      margin: EdgeInsets.only(right: 5, bottom: 5, top: 2),
      width: 165,
      height: 67,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text("25.5ºC",
            style: MyTextStyle.estiloBold(30, Colors.white)),
      ),
    );
  }


  Widget bar() {
    return Container(
        margin: EdgeInsets.only(top: 8),
        width: 420,
        height: 41,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Mas datos",
                style: MyTextStyle.estiloBold(20, Colors.grey),),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(icon: Icon(Icons.navigate_next), iconSize: 30,
                color: Colors.white, onPressed: () {},),
            ),
          ],
        )
    );
  }


  Widget circulito(size, color) {
    //this is base circle
    return Container(
      child: CustomPaint(painter: DrawCircle(size, color, PaintingStyle.fill,1.0)
      ),
    );
  }



}
