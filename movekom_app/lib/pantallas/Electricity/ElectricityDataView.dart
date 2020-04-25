import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ElectricityDataView extends StatefulWidget {
  @override
  _ElectricityDataViewState createState() => _ElectricityDataViewState();
}

class _ElectricityDataViewState extends State<ElectricityDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: electricityDatos(),
    );
  }


  Widget electricityDatos() {
    return Container(
      child: Column(
        children: <Widget>[
          rowOfboxes(),
          rowOfboxes(),
          graphic("GRAFICO DE CARGA"),
          graphic("GRAFICO DE DESCARGA"),
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
    );
  }


  Widget rowOfboxes() {
    return Container(
      //    color: Colors.green,
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          boxCarga(),
          boxCarga(),
          boxCarga(),
          boxCarga(),
          boxCarga(),
          boxCarga(),
        ],
      ),
    );
  }

  Widget boxCarga() {
    return Container(
      margin: EdgeInsets.all(5),
      width: 137,
      height: 67,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              left: 5,
              top: 3,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Carga de solar",
                  style: MyTextStyle.estiloBold(15, Colors.white),),
              )
          ),
          Positioned.fill(
              top: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text("12.5",
                  style: MyTextStyle.estiloBold(25, Colors.lightGreenAccent),),
              )
          )
        ],
      ),
    );
  }


  Widget graphic(grTitle) {
    return Container(
      //color: Colors.blue,
      width: 860,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 3),
            child: textoGrafico(grTitle),
          ),
          Container(
              margin: EdgeInsets.all(5),
              width: 846,
              height: 100,
              decoration: new BoxDecoration(
                  color: Color(0xff2d3033)
              )
          ),
        ],
      ),
    );
  }


  Widget textoGrafico(title) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontFamily: 'Mada',
          color: Color(0xff9d9d9d),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget bottomTextMenu() {
    return Container(
      //  color: Colors.blueGrey,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          textoGrafico("ESTADO"),
          textoGrafico("EQUIPOS"),
          textoGrafico("DATOS"),
          textoGrafico("AJUSTE"),
        ],
      ),
    );
  }

}
