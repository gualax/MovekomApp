import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/electricidad/PanelSolar.dart';
import 'package:movekomapp/controladores/nevera/nevera.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

class ToolsMenuPage extends StatefulWidget {
  @override
  _ToolsMenuPageState createState() => _ToolsMenuPageState();
}

class _ToolsMenuPageState extends State<ToolsMenuPage> {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MyContainer(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              column1(),
              column2(),
            ],
          )),
    );
  }

  Widget column1() {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Nevera(2),
          Inversor(2),
        ],
      ),
    );
  }

  Widget column2() {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CargadorBaterias(1),
          PanelSolar(2),
        ],
      ),
    );
  }
}
