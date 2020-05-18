import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
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

  Widget RowOfWheaterWidgets() {
    return Container(
  //    color: Colors.red,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
   //     scrollDirection: Axis.horizontal,
/// ver por que solo muestra el utlimo llamado, ver forma desde el el parsing de convertir esto en un array =)
        children: <Widget>[
          WeatherBox("Buenos Aires",0),
          WeatherBox("Buenos Aires",1),
          WeatherBox("Buenos Aires",2),
          WeatherBox("Buenos Aires",3),
          WeatherBox("Buenos Aires",4),
          WeatherBox("Buenos Aires",5),
        ],
      ),
    );
  }

  Widget WheaterWidget(day,iconRoute,tMin,tMax){
    return Container(
        width: 160,
        height: 115,
        margin: EdgeInsets.only(left: 1,right: 1),
        decoration: new BoxDecoration(
            color: MyColors.ContainerColor,
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill( /// DAY
              top: 5,
                left: 7,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(day,style: MyTextStyle.estiloBold(15, Colors.white),),
                )
            ),
            Positioned.fill(  /// ICON
                child: Align(
                  alignment: Alignment.center,
                  child: iconSvgD(iconRoute,Colors.white, 50),
                ),
            ),
            Positioned.fill(  /// tMIN
              bottom: 5,
              left: 5,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Min: " + tMin,style: MyTextStyle.estilo(12, Colors.white),),
              ),
            ),
            Positioned.fill(  /// tMax
              bottom: 5,
              right: 5,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text("Max: " + tMax,style: MyTextStyle.estilo(12, Colors.white),),
              ),
            ),
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

  Widget graphic(){
     return Container(
       margin: EdgeInsets.only(left: 10),
        width: 699,
        height: 165,
        decoration: new BoxDecoration(
            color: MyColors.ContainerColor
        )
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

}
