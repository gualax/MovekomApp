import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterCalefactionView extends StatefulWidget {
  @override
  _WheaterCalefactionViewState createState() => _WheaterCalefactionViewState();
}

class _WheaterCalefactionViewState extends State<WheaterCalefactionView> {
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return contenido();
  }



  Widget contenido() {
    return Container(
     //   margin: EdgeInsets.only(top: SC.all(10)),
        // color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Calefaccion(2),
            container(),
           // AireAcondicionado(2),
          ],
        ),
    );
  }




  Widget container() {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WeatherBox(0,1),
          Extractor(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              box165x67("INTERIOR","25.5"),
              box165x67("EXTERIOR","25.5"),
            // box247x144(),
            ],
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

  Widget box165x67(title, value) {
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

  Widget manuales() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 185,
      height: 68,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text("Manuales",
            style: MyTextStyle.estiloBold(30, Colors.white)),
      ),
    );
  }

  Widget ayuda() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      width: 185,
      height: 68,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text("Ayuda",
            style: MyTextStyle.estiloBold(30, Colors.white)),
      ),
    );
  }

  Widget bar_historico_temp() {
    return MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 380,
        height: 41,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Historico de temperatura",
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
