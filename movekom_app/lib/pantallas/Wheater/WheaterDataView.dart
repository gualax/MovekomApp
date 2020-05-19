import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/pantallas/Wheater/weather_list.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterDataView extends StatefulWidget {
  @override
  _WheaterDataViewState createState() => _WheaterDataViewState();
}

class _WheaterDataViewState extends State<WheaterDataView> {
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
          RowOfTempAndGraphics(),
          RowOfTempAndGraphics()
        ],
      ),
    );
  }

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
    return Container(
      margin: EdgeInsets.all(10),
        width: 170,
        height: 135,
        decoration: new BoxDecoration(
            color: MyColors.ContainerColor
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
        height: 160,
        decoration: new BoxDecoration(
            color: MyColors.ContainerColor
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
