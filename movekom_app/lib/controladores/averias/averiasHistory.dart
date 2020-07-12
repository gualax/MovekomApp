import 'package:flutter/cupertino.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class AveriasHistory extends StatelessWidget {
  DateTime dateTime;
  String title = "AVERIA CALEFACTOR F02";
  String section = "CLIMA - Calefaccion";


  AveriasHistory({this.title});
  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.now();
    return historyBox();
  }



  Widget historyBox(){
    return Container(
      margin: EdgeInsets.all(7),
      height: 60,
      width: 1100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
          children: <Widget>[
      MyPositioned.fill( /// fecha
       left: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(fecha(),
                style: MyTextStyle.estilo(15, MyColors.text) ) ,
          )
      ),
      MyPositioned.fill(  /// title
          child: Align(
            alignment: Alignment.center,
            child: Text(title,
                style: MyTextStyle.estilo(15, MyColors.text) ) ,
          )
      ),
            MyPositioned.fill(  /// secti
               right: 10,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(section,
                      style: MyTextStyle.estilo(15, MyColors.text) ) ,
                )
            ),
      ]
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
