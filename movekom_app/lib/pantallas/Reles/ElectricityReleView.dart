import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ElectricityReleView extends StatefulWidget {
  @override
  _ElectricityReleViewState createState() => _ElectricityReleViewState();
}

class _ElectricityReleViewState extends State<ElectricityReleView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: SC.right(20)),
         //        color: Colors.blue,
              alignment: Alignment.center,
              child: releContainer(),
            ),
          )
        ],
      ),
    );
  }


  Widget releContainer(){
    return MyContainer (
      margin: EdgeInsets.only(right: SC.right(80)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          releRow(),
          releRow2(),
          releRow3(),
        ],
      ),
    );
  }

Widget releRow(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          rele("LUZ 1"),
          rele("LUZ 2"),
          rele("LUZ 3"),
          rele("LUZ 4"),
          rele("LUZ 5"),
          rele("LUZ 6"),
          rele("AUXILIAR 1"),
        ],
      ),
    );
}

  Widget releRow2(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          rele("INVERSOR"),
          rele("CARGADOR"),
          rele("PLACA SOLAR"),
          rele("BAT. MOTOR"),
          rele("BAT. AUXILIAR"),
          rele("CONSUMIBLES"),
          rele("AUXILIAR 2"),
        ],
      ),
    );
  }

  Widget releRow3(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          rele("CALEFACCION"),
          rele("BOILER"),
          rele("NEVERA"),
          rele("BOMBA AGUA"),
          rele("VALV. DRENAJE"),
          rele("AUXILIAR 3"),
          rele("AUXILIAR 4"),
        ],
      ),
    );
  }


Widget rele(title){
  return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      width: 120,
      height: 120,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
    child: Stack(
      children: <Widget>[
        MyPositioned.fill(
          top: 5,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(title,
              style: MyTextStyle.estiloBold(14, MyColors.text),),
            )
        ),
        MyPositioned.fill(
            child: Align(
              child: rele_img(),
            )
        ),
      ],
    ),
  );
}

Widget rele_img(){
    return MyContainer(
      width: 80,
        height: 80,
        decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/reles/rele10.png"),
          fit: BoxFit.contain,
      ),
     ),
    );
}



}

