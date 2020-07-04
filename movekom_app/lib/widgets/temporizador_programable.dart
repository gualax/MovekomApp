import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'IconSvg.dart';

class TemporizadorProg extends StatefulWidget {
  @override
  _TemporizadorProgState createState() => _TemporizadorProgState();
}

class _TemporizadorProgState extends State<TemporizadorProg> {
  @override
  Widget build(BuildContext context) {
    return _buildTempDialog();
  }



  Widget _buildTempDialog() {
    return new AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              child: Align(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    columnProgramas1(),
                    columnProgramas2(),
                    big_box(),
                  ],
                ),
              ),
            ),
             MyPositioned.fill(
               top: 5, right: 5,
                 child: Align(
                   alignment: Alignment.topRight,
                   child: GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: closeBtn(),
                   ),
                 )
             ),
          ],
        ),
      ),
    );
  }



  Widget closeBtn(){
    return MyContainer(
      height: 45,
      width: 45,
      child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 20),
    );
  }

  Widget columnProgramas1(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        box_program("PROGRAMA 1"),
        box_program("PROGRAMA 2"),
        box_program("PROGRAMA 3"),
      ],
    );
  }

  Widget columnProgramas2(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        box_program("PROGRAMA 4"),
        box_program("PROGRAMA 5"),
        box_program("PROGRAMA 6"),
      ],
    );
  }

  Widget box_program(title){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(15)),
      height: 110 ,
      width: 270,
      color: MyColors.baseColor,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            left: 10, top: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(title,
                style: MyTextStyle.estilo(17, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              right: 10, top: 10,
              child: Align(
                alignment: Alignment.topRight,
                child: iconSvgD("assets/icons/on_off.svg", MyColors.principal, 20),
              ),
          ),
          MyPositioned.fill(
            left: 90,
            child: Align(
              alignment: Alignment.center,
              child:Text("20 ºC",
                style: MyTextStyle.estilo(30, MyColors.text),)
            ),
          ),
          MyPositioned.fill(
            left: 15, bottom: 10,
            child: Align(
                alignment: Alignment.centerLeft,
                child:Text("10:00 -  18:00",
                  style: MyTextStyle.estilo(14, MyColors.text),)
            ),
          ),
          MyPositioned.fill(
            left: 15, top: 35,
            child: Align(
                alignment: Alignment.centerLeft,
                child:Text("L M X J V S D",
                  style: MyTextStyle.estiloBold(14, MyColors.text),)
            ),
          ),
        ],
      ),
    );
  }

Widget big_box() {
  return MyContainer(
    margin: EdgeInsets.all(SC.all(7)),
    height: 394.00,
    width: 400.00,
    color: MyColors.baseColor,
    child: Center(
      child: Text("PULSA SOBRE EL PROGRAMADESEADO PARA CONFIGURAR SU FUNCIONAMIENTO",
        style: MyTextStyle.estilo(25, MyColors.text),
        textAlign: TextAlign.center,),
    ),
  );
}

}
