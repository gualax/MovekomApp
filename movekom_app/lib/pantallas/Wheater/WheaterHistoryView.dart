import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/pantallas/Wheater/weather_list.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterHistoryView extends StatefulWidget {
  @override
  _WheaterHistoryViewState createState() => _WheaterHistoryViewState();
}

class _WheaterHistoryViewState extends State<WheaterHistoryView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return contenido();
  }



  Widget contenido(){
    return Container(
 //     color:Colors.blue,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          WeatherListWidget("Buenos Aires"),
          electricityDatos(),
        ],
      ),
    );
  }

  Widget electricityDatos() {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          daysAndHours(),
          voltaje_totalizador(),
          graficos(),
        ],
      ),
    );
  }


  Widget daysAndHours(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        days("24 HORAS"),
        days("7 DIAS"),
        days("15 DIAS"),
        days("30 DIAS")
      ],
    );
  }

  Widget days(title){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 160,
      height: 65,
      decoration: BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Center(
        child: Text(title,
            style: MyTextStyle.estiloBold(18, MyColors.principal)),
      ),
    );
  }

  Widget graficos(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        graphic(),
        graphic(),
      ],
    );
  }

  Widget voltaje_totalizador(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        temp_interior(),
        temp_ext(),
      ],
    );
  }

  Widget temp_interior(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 160,
      height: 146,
      decoration: BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack (
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("TEMPERATURA INTERIOR",
                  style: MyTextStyle.estilo(14, MyColors.text),
                  textAlign: TextAlign.center),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text("Maximas",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            top:25,
            child: Align(
              alignment: Alignment.center,
              child: Text("26.5" + "Cº",
                style: MyTextStyle.estilo(12, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom:35 ,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Minimas",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("26.5" + "Cº",
                style: MyTextStyle.estilo(12, MyColors.text),),
            ),
          ),
        ],
      ),
    );
  }

  Widget temp_ext(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 160,
      height: 146,
      decoration: BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack (
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("TEMPERATURA EXTERIOR",
                  style: MyTextStyle.estilo(14, MyColors.text),
                  textAlign: TextAlign.center),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text("Maximas",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            top:25,
            child: Align(
              alignment: Alignment.center,
              child: Text("26.5" + "Cº",
                style: MyTextStyle.estilo(12, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom:35 ,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Minimas",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("26.5" + "Cº",
                style: MyTextStyle.estilo(12, MyColors.text),),
            ),
          ),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////////////
  Widget RowOfTempAndGraphics(){
    return Container(
      margin: EdgeInsets.only(top:7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tempBox(14.5,22.5),
          tempBox(14.5,22.5),
          graphic(),
        ],
      ),
    );
  }



  Widget tempBox(tMin,tMax){
    return MyContainer(
      margin: EdgeInsets.all(10),
        width: 170,
        height: 135,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              top:10,
                left: 10,
                right: 10,
                child: Align(
                  alignment: Alignment.topCenter,
                  child:  Text("TEMPERATURA MAXIMAS Y MINIMAS",
                  style: MyTextStyle.estilo(20, Colors.white),
                  ),
                )
            ),
            Positioned.fill(
              left: 10,
                top:65,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text("Minimas",
                    style: MyTextStyle.estilo(10, Colors.white),),
                )
            ),
            Positioned.fill(
              right: 10,
                top:65,
                child: Align(
                  alignment: Alignment.centerRight,
                  child:  Text("Maximas",
                    style: MyTextStyle.estilo(10, Colors.white),),
                )
            ),
            Positioned.fill(
                left: 10,
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child:  Text(tMin.toString() + "ºC",
                    style: MyTextStyle.estilo(10, Colors.white),),
                )
            ),
            Positioned.fill(
                right: 10,
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child:  Text(tMax.toString() + "ºC",
                    style: MyTextStyle.estilo(10, Colors.white),),
                )
            )
          ],
        ),
    );
  }


  Widget graphic(){
    var data = [0.0, 1.0, 1.5, 1.8, 0.9, 0.6, 0.2, 0.3, 0.4, 0.8, 1.0];
    return Container(
        margin: EdgeInsets.only(left: 10),
        width: 699,
        height: 150,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Center(
          child: Container(
            width: 690,
            height: 150,
            child: Sparkline(
              data:data,
              lineWidth: 2.0,
              lineColor: Colors.white,
              pointsMode: PointsMode.all,
              pointSize: 8.0,
              pointColor: Colors.lightGreenAccent,
              fillMode: FillMode.below,
              fillGradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green[900], Colors.lightGreen],
              ),
            ),
          ),
        ),
    );
  }

}
