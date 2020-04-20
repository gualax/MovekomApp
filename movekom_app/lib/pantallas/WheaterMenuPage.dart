import 'package:flutter/material.dart';


class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.black,
          body:Column(
            children: <Widget>[
              moveTitle(),
              contenido(),
            ],
          )
      );
  }


  Widget moveTitle(){
    return
      Container(
      //  color: Colors.blueGrey,
        margin: EdgeInsets.only(left: 30),
        alignment: Alignment.topLeft,
        height: 70,
        child: RichText(
            text: new TextSpan(
                children: [
                  new TextSpan(
                      text: "CLIMA ",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xffffffff),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  new TextSpan(
                      text: "CONTROL DE CALEFACCION",
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


  Widget contenido(){
    return Expanded(
      child: Container(
       // color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            bigBox(),
            container(),
          ],
        ),
      ),
    );
  }


  Widget bigBox(){
    return Container(
      margin: EdgeInsets.all(20),
        width: 462,
        height: 388,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        )
    );
  }

  Widget container(){
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
      )
  );
}

Widget box247x144(){
  return Container(
    margin: EdgeInsets.only(left: 5,bottom: 6),
      width: 247,
      height: 144,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}

Widget box165x67(){
  return Container(
      margin: EdgeInsets.only(right: 5,bottom: 5,top: 2),
      width: 165,
      height: 67,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      )
  );
}


  Widget bar(){
    return Container(
        margin: EdgeInsets.only(top: 8),
        width: 420,
        height: 41,
        decoration: new BoxDecoration(
            color: Color(0xff2d3033)
        )
    );
  }


}

