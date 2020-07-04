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
      height: 240,
      width:260 ,
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
          ),
          MyPositioned.fill(
            left: 15,bottom: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("PIN ANTERIOR:",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              bottom:40,right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: MyContainer(
                  height: 40, width: 120,
                  child: TextField(
                    style: MyTextStyle.estiloBold(17, Colors.white),
                    focusNode: FocusNode(),
                    textAlign: TextAlign.center,
                    maxLength: 14,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: new InputDecoration(
                      counterText: '',
                      counterStyle: TextStyle(fontSize: 0),
                      hintText: '40',
                      hintStyle: MyTextStyle.estiloBold(17, Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.principal, width: SC.wid(2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: SC.wid(2)),
                      ),
                    ),
                  ) ,
                ),
              )
          ),
          MyPositioned.fill(
              left: 20,top: 80,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("PIN NUEVO:",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top:70,right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: MyContainer(
                  height: 40, width: 120,
                  child: TextField(
                    style: MyTextStyle.estiloBold(17, Colors.white),
                    focusNode: FocusNode(),
                    enableInteractiveSelection: false,
                    textAlign: TextAlign.center,
                    maxLength: 14,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: new InputDecoration(
                      counterText: '',
                      counterStyle: TextStyle(fontSize: 0),
                      hintText: '40',
                      hintStyle: MyTextStyle.estiloBold(17, Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.principal, width: SC.wid(2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: SC.wid(2)),
                      ),
                    ),
                  ) ,
                ),
              )
          ),
          MyPositioned.fill(
              bottom: 10,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MyContainer(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.principal,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(SC.all(20)))
                    ),
                    child: Center(
                      child: Text("Guardar",
                        style: MyTextStyle.estilo(17, MyColors.text),),
                    ),
                  )
              )
          ),
        ],
      ),
    );
  }
}
