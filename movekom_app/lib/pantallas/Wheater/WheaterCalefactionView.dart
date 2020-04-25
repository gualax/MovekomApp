import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
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
            bigBox("20"),
            container(),
          ],
        ),
    );
  }


  Widget bigBox(txtTemp) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 462,
      height: 388,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              left: 50,
              top: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Calefaccion",
                  style: MyTextStyle.estiloBold(35, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 20,
              child: Align(
                alignment: Alignment.center,
                child: Text(txtTemp,
                  style: MyTextStyle.estiloBold(100, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/fire.svg", Colors.white, 130),
              )
          ),
          Positioned.fill(
              left: 30,
              bottom: 22,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Pulse para apagar",
                  style: MyTextStyle.estiloBold(20, Colors.white),),
              )
          ),
          Positioned.fill(
              right: 170,
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.power_settings_new), iconSize: 30,
                  color: Colors.lightGreenAccent, onPressed: () {},),
              )
          ),
          Positioned.fill(
            top:30,
            left: 30,
            child: Align(
              alignment: Alignment.topLeft,
              child: circulito(10.0, Colors.lightGreenAccent),
            ),
          )
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
          box420(),
          bar(),
        ],
      ),

    );
  }

  Widget box420() {
    return Container(
      margin: EdgeInsets.all(5),
      width: 420,
      height: 174,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              left: 10,
              top: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Extraccion",
                  style: MyTextStyle.estiloBold(30, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 20,
              top: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/fan.svg", Colors.white, 70),
              )
          ),
          Positioned.fill(
              left: 30,
              child: Align(
                alignment: Alignment.center,
                child: Text("21",
                  style: MyTextStyle.estiloBold(70, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 30,
              bottom: 15,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Pulse para encender",
                  style: MyTextStyle.estiloBold(20, Colors.white),),
              )
          ),
          Positioned.fill(
              right: 200,
              bottom: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.power_settings_new), iconSize: 30,
                  color: Colors.white, onPressed: () {},),
              )
          ),
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
