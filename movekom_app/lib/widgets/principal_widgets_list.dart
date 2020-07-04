import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/WidgetsMenu.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';

import 'MyTextStyle.dart';

class PrincipalWidgetsList extends StatefulWidget {
  @override
  _PrincipalWidgetsListState createState() => _PrincipalWidgetsListState();
}

class _PrincipalWidgetsListState extends State<PrincipalWidgetsList> {
  @override
  Widget build(BuildContext context) {
    return horizontalList();
  }


  Widget horizontalList(){
    return Container(
      alignment: Alignment.center,
      height: SC.hei(150),
      margin: EdgeInsets.only(left: SC.left(40),top: SC.top(20)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          widgetBoiler(1),
          Calefaccion(1),
          Inversor(1),
          //box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
          add_device(),
        ],
      ),
    );
  }

  Widget add_device(){
    return  GestureDetector(
      onTap: () {
        print("TAP");
        showDialog(
          context: context,
          builder: (BuildContext context) => WidgetsMenu(),
        );

      },
      child: MyContainer(
        width: 225,
        height: 140,
        margin: EdgeInsets.all(SC.all(10)),
        child: DottedBorder(
          dashPattern: [8, 4],
          strokeWidth: 2,
          color: Colors.white,
          child: MyContainer(
            width: 225,
            height: 140,
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.add,size: 60,color: Colors.white,)
                    )
                ),
                MyPositioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("AÑADIR DISPOSITIVO",
                          style: MyTextStyle.estilo(16, Colors.white),)
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
