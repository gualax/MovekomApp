import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/reles/reles_widget.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/rele_dialog.dart';


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
             // margin: EdgeInsets.only(right: SC.right(20)),
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
      margin: EdgeInsets.only(right: SC.right(80),left: SC.left(80) ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          releRowW(),
      //    releRow2(),
       //   releRow3(),
        ],
      ),
    );
  }


  Widget releRowW(){
    return Container(
      child: Wrap(
        children: <Widget>[
          ReleWidget("LUZ 1",false),
          ReleWidget("LUZ 2",true),
          ReleWidget("LUZ 3",true),
          ReleWidget("LUZ 4",true),
          ReleWidget("LUZ 5",true),
          ReleWidget("LUZ 6",true),
          ReleWidget("AUXILIAR 1",true),
          ReleWidget("INVERSOR",true),
          ReleWidget("CARGADOR",false),
          ReleWidget("PLACA SOLAR",true),
          ReleWidget("BAT. MOTOR",true),
          ReleWidget("BAT. AUXILIAR",true),
          ReleWidget("CONSUMIBLES",true),
          ReleWidget("AUXILIAR 2",true),
          ReleWidget("CALEFACCION",true),
          ReleWidget("BOILER",true),
          ReleWidget("NEVERA",true),
          ReleWidget("BOMBA AGUA",true),
          ReleWidget("VALV. DRENAJE",true),
          ReleWidget("AUXILIAR 3",true),
          ReleWidget("AUXILIAR 4",true),
        ],
      ),
    );
  }


}

