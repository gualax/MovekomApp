import 'package:flutter/material.dart';


class ElectricityPage extends StatefulWidget {
  @override
  _ElectricityPageState createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: <Widget>[
              title(),
            rowOfboxes(),
            rowOfboxes(),
            graphic("GRAFICO DE CARGA"),
            graphic("GRAFICO DE DESCARGA"),
            bottomTextMenu()
          ],
        )
    );
  }



  Widget title(){
    return
      Container(
     //   color: Colors.blueGrey,
        margin: EdgeInsets.only(left: 30),
        alignment: Alignment.topLeft,
        height: 60,
        child: RichText(
            text: new TextSpan(
                children: [
                  new TextSpan(
                      text: "ELECTRICIDAD ",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xffffffff),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  new TextSpan(
                      text: "GRAFICOS Y CONSUMOS",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xff9d9d9d),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                ]
            )
        ),
      );
  }

 Widget rowOfboxes(){
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

 Widget boxCarga(){
   return Container(
       margin: EdgeInsets.all(5),
       width: 137,
       height: 67,
       decoration: new BoxDecoration(
           color: Color(0xff2d3033)
       )
   );
 }


 Widget graphic(grTitle){
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


 Widget textoGrafico(title){
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

  Widget bottomTextMenu(){
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
