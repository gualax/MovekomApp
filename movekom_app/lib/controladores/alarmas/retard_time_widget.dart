import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class RetardTimeWidget extends StatefulWidget {
  @override
  _RetardTimeWidgetState createState() => _RetardTimeWidgetState();
}

class _RetardTimeWidgetState extends State<RetardTimeWidget> {
  String title = "TIEMPO DE RETARDO";

  @override
  Widget build(BuildContext context) {
    return change_desconection_key();
  }

  Widget change_desconection_key(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      height: 240,
      width: 260 ,
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
            bottom: 40, left: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("CONEXION:",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              bottom:65,right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: MyContainer(
                  height: 40, width: 120,
                  child:TextField(
                    style: MyTextStyle.estiloBold(13, Colors.white),
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
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.principal, width: SC.wid(2)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: SC.wid(2)),
                      ),
                    ),
                  ) ,
                ),
              )
          ),
          MyPositioned.fill(
            top:80,left: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("DESCONEXION:",
                  style:MyTextStyle.estilo(15, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top:50,right: 10,
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
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColors.principal, width: SC.wid(2)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: SC.wid(2)),
                      ),
                    ),
                  ) ,
                ),
              )
          ),
          MyPositioned.fill(
              bottom: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: null,
                  child: Text('Guardar', style: TextStyle(
                      color: MyColors.text
                  )
                  ),
                  textColor: MyColors.text,
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: MyColors.principal,
                      width: SC.wid(2),
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(50)),
                )
              )
          )
        ],
      ),
    );
  }



}
