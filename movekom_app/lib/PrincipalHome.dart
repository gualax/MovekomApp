
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/box137x137.dart';
import 'package:movekomapp/widgets/box137x64.dart';
import 'package:movekomapp/widgets/box225x137.dart';

class PrincipalHome extends StatefulWidget {
  @override
  _PrincipalHomeState createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: <Widget>[
            moveTitle(),
            contenido(),
            carruselDispositivos(),
          ],
        )
      );
  }

  Widget carruselDispositivos(){
      return Expanded(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box225x137("Valvulas(Todas)","OFF","2.65 A",""),
              box225x137("Inversor de corriente","OFF","",""),
              box225x137("Calefaccion","OFF","",""),
              box225x137("Boiler","ON","Consumo:2.65A",""),
            ],
          ),
        ),
      );
  }
  

  Widget contenido(){
    return Container(
      child: Row( /// elementos uno al lado del otro
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          leftSection(),
          midleLeftSection(),
          midleRigthSection(),
          rightSection(),
        ],
      ),
    );
  }

  Widget midleLeftSection(){
  return
  Container (
    margin: EdgeInsets.all(5),
    child:
    Column(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        columnOfHalfBoxes(),
        box137x137_parms("Pronostico","","",null),
        //    principalLeftRow3(),
        //   principalLeftRow4(),
      ],
    ),
  );
  }

  Widget midleRigthSection(){
    return
      Container (
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
               box137x137_parms("Luz general","OFF","2.65A",null),
                box137x137_parms("Luz general","OFF","2.65A",null),
              ],
            ),
            Row(
              children: <Widget>[
                box137x137_parms("Downligth","OFF","2.65A",null),
                box137x137_parms("Uplight","OFF","2.65A",null),
              ],
            ),
          ],
        ),
        );
  }

  Widget rightSection(){
      return
        Container (
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[
                  box137x137_parms("Aguas limpias","","",null),
                  box137x137_parms("Aguas negras","","",null),
                ],
              ),
              Row(
                children: <Widget>[
                  box137x137_parms("Aguas sucias","","",null),
                  box137x137_parms("Bomba de agua","","",null),
                ],
              ),
            ],
          ),
        );
    }



  Widget leftSection(){
    return
    Container (
      margin: EdgeInsets.all(5),
      child:
    Column(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        principalLeftRow1(),
        principalLeftRow2(),
      ],
    ),
    );
  }

  

  Widget moveTitle(){
    return
      Container(
        margin: EdgeInsets.only(left: 8),
        alignment: Alignment.topLeft,
        height: 100,
        child: RichText(
          text: new TextSpan(
              children: [
                new TextSpan(
                    text: "HOME ",
                    style: TextStyle(
                      fontFamily: 'Mada',
                      color: Color(0xffffffff),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )
                ),
                new TextSpan(
                    text: "PANTALLA GENERAL",
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


  Widget principalLeftRow1(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            box137x137_parms("Bateria motor","12.45v","23.65A", null),
            box137x137_parms("Bateria Auxiliar 1","12.45v","23.65A", null),
            box137x137_parms("Bateria Auxiliar 2","12.45v","23.65A", null),
          ],
        ),
      );
  }


  Widget principalLeftRow2(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            box137x137_parms("Totalizador","Cargando","",null),
            columnOfHalfBoxes(),
            columnOfHalfBoxes(),
          ],
        ),
      );
  }



Widget columnOfHalfBoxes(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box137x64_params("Interior","Humedad","36%",null),
          box137x64_params("Exterior","Humedad","36%",null),
        ],
      ),
    );
}








}

