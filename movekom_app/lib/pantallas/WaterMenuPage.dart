

import 'package:flutter/material.dart';

class WaterMenuPage extends StatefulWidget {
  @override
  _WaterMenuPageState createState() => _WaterMenuPageState();
}

class _WaterMenuPageState extends State<WaterMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:Container(
              child: Column(
                      children: <Widget> [
                        ],
              ),
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
                      text: "AGUA ",
                      style: TextStyle(
                        fontFamily: 'Mada',
                        color: Color(0xffffffff),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  new TextSpan(
                      text: "NIVELES DEPOSITOS Y VALVULAS",
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


}
