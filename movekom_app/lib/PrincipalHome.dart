
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/widgets/box137x137.dart';
import 'package:movekomapp/widgets/box137x64.dart';
import 'package:movekomapp/widgets/box230x137.dart';

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
              principalLeftRow4(),
              principalRightRow4(),
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
        box137x137(),
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
                box137x137(),
                box137x137(),
              ],
            ),
            Row(
              children: <Widget>[
                box137x137(),
                box137x137(),
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
                  box137x137(),
                  box137x137(),
                ],
              ),
              Row(
                children: <Widget>[
                  box137x137(),
                  box137x137(),
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
            box137x137(),
            box137x137(),
            box137x137(),
          ],
        ),
      );
  }

  Widget principalLeftRow4(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box230x137(),
              box230x137(),
             ],
          ),
        ),
      );
  }


  Widget principalLeftRow2(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            box137x137(),
            columnOfHalfBoxes(),
            columnOfHalfBoxes(),
          ],
        ),
      );
  }

  Widget principalLeftRow3(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box137x137(),
              box137x137(),
              box137x137(),
            ],
          ),
        ),
      );
  }


Widget columnOfHalfBoxes(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box137x64(),
          box137x64(),
        ],
      ),
    );
}


  Widget principalRightRow1(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              columnOfHalfBoxes(),
              box137x137(),
              box137x137(),
            ],
          ),
        ),
      );
  }

  Widget principalRightRow2(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box137x137(),
              box137x137(),
              box137x137(),
            ],
          ),
        ),
      );
  }



  Widget principalRightRow3(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box137x137(),
              box290x137(),
            ],
          ),
        ),
      );
  }


  Widget principalRightRow4(){
    return
      Expanded(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box230x137(),
              box230x137(),
            ],
          ),
        ),
      );
  }


    Widget box290x137(){
    return  Container(
        margin: EdgeInsets.all(7),
        width: 295,
          height: 137,
          decoration: BoxDecoration(
              color: const Color(0xff2d3033)
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            PositionedDirectional(
              top: 4,
              start: 10,
                  child:   RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style:estilo(),
                                text: "Valvulas ("),
                            TextSpan(
                                style:estilo(),
                                text: "(Todas)")
                          ]
                      )
              ),
            ),
            // OFF
            PositionedDirectional(
              bottom: 4,
              start: 24,
                  child:   Text(
                      "OFF",
                      style: estilo(),
                      textAlign: TextAlign.center
              ),
            ),
            // 2.65 A
            PositionedDirectional(
              bottom: 4,
              end: 10,
                  child:   Text(
                      "2.65 A ",
                      style: estilo(),
                      textAlign: TextAlign.center
                  )
            )
          ])
      );
    }



  TextStyle estilo(){
     return TextStyle(
         color:  const Color(0xffffffff),
         fontWeight: FontWeight.w300,
         fontFamily: "Mada",
         fontStyle:  FontStyle.normal,
         fontSize: 15.0
     );
   }



}

