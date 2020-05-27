import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ElectricitySettingsView extends StatefulWidget {
  @override
  _ElectricitySettingsViewState createState() => _ElectricitySettingsViewState();
}

class _ElectricitySettingsViewState extends State<ElectricitySettingsView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            //flex: 2,
            child: MyContainer(
              margin: EdgeInsets.only(left: SC.left(20)),
        //        color: Colors.lightGreen,
              alignment: Alignment.center,
              child: ajusteDeBateria(),
            ),
          ),
          Expanded(
            flex: 3,
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
          releRow(),
          releRow(),
          releRow(),
        ],
      ),
    );
  }

Widget releRow(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          rele(),
          rele(),
          rele(),
          rele(),
          rele(),
          rele(),
          rele(),
          rele(),
        ],
      ),
    );
}


Widget rele(){
  return MyContainer(
      margin: EdgeInsets.all(SC.all(8)),
      width: 83,
      height: 83,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/reles/rele10.png"),
          fit: BoxFit.contain,
        ),
      ),
  );
}


Widget ajusteDeBateria(){
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titleWidget(),
          cargador(),
          cargador(),
          cargador(),
          cargador(),
        ],
      ),
    );
}

Widget cargador(){
    return MyContainer(
      margin: EdgeInsets.only(left: SC.left(50)),
      height: 110,
      width: 200,
      decoration: new BoxDecoration(
          color: MyColors.baseColor,
      ),
      child:  Stack(
        children: <Widget>[
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: rectangulo(),
              )
          ),
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Tipo de bateria",
                  style: MyTextStyle.estilo(16, Colors.white),
                  textAlign: TextAlign.center,),
              )
          ),
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text("AG",
                  style: MyTextStyle.estiloBold(23, Colors.white),
                  textAlign: TextAlign.center,),
              )
          ),
        ],
      ),
    );
}

Widget rectangulo(){
return MyContainer(
    height: 50,
    width:90,
  decoration:new BoxDecoration(
      border: Border.all(color: Colors.grey),
  ),
);
}

  Widget titleWidget(){
    return MyContainer(
      padding: EdgeInsets.all(SC.all(5)),
      margin: EdgeInsets.only(left: SC.left(50)),
      height: 40,
      width:200,
      decoration:new BoxDecoration(
        color:MyColors.baseColor,
      ),
      child: Text("AJUSTES DE BATERIA",
        style: MyTextStyle.estilo(17, Colors.white),
        textAlign: TextAlign.center,  ),
    );
  }
}

