import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/warning_blocs/warning_list_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class Averia extends StatelessWidget {
  DateTime dateTime;
  String title;
  String description = "Bloqueo de calefactor tras varios intentos de arranque";
  String section = "CLIMA Calefaccion";
  Widget widget;
  WarningListItemBloc bloc;
  Averia({this.title});

  @override
  Widget build(BuildContext context) {
     dateTime = DateTime.now();
    return alertBox();
  }


  Widget alertBox(){
    return MyContainer(
      height: 100,
      width: 900,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill( /// fecha
            top:5, left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(fecha(),
                  style: MyTextStyle.estilo(18, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// title
              top:5, left: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                    style: MyTextStyle.estilo(18, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// description
              left: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(description,
                    style: MyTextStyle.estilo(17, MyColors.text) ) ,
              )
          ),
          MyPositioned.fill(  /// section
              right: 5,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(section,
                    style: MyTextStyle.estilo(17, MyColors.text),
                  textAlign:  TextAlign.center , ) ,
              )
          ),
          MyPositioned.fill(  /// icono
              left: 20,top: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child:iconSvgNc("assets/icons/warning.svg", 28),
              )
          ),
        ],
      ),
    );
  }

  Widget alertRow() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          alertBox(),
          criticBox(),
          deleteBox(),
        ],
      ),
    );
  }
  Widget deleteBox() {
    return GestureDetector(
      child: MyContainer(
        height: 100, width: 100,
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("BORRA",
                    style: MyTextStyle.estiloBold(18, MyColors.text)),
              ),
            ),
            MyPositioned.fill(
              top: 25,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD("assets/icons/eraser.svg", MyColors.text, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget criticBox() {
    return MyContainer(
      height: 100, width: 100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("CRITIC",
                  style: MyTextStyle.estiloBold(18, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            top: 25,
            child: Align(
              alignment: Alignment.center,
              child: Text("SI",
                  style: MyTextStyle.estiloBold(18, MyColors.text)
              ),
            ),
          ),
        ],
      ),

    );
  }

  String fecha(){
    return
      dateTime.day.toString() + "/"
       + dateTime.month.toString() + "/"
       + dateTime.year.toString() + " a las "
        + dateTime.hour.toString() + ":"
        + dateTime.minute.toString();
  }

}
