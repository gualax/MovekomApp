import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ChangeDesconectionPin extends StatefulWidget {
  @override
  _ChangeDesconectionPinState createState() => _ChangeDesconectionPinState();
}

class _ChangeDesconectionPinState extends State<ChangeDesconectionPin> {
  String title = "CAMBIAR CLAVE DE DESCONEXION";
  @override
  Widget build(BuildContext context) {
    return change_desconection_key();
  }

  Widget change_desconection_key(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      height: 180,
      width:265 ,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top:10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          )
        ],
      ),
    );
  }
}
