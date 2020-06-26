import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class DateWidet extends StatefulWidget {
  @override
  _DateWidetState createState() => _DateWidetState();
}

class _DateWidetState extends State<DateWidet> {

  DateTime dateTime = DateTime.now();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(Duration(seconds: 20), (v){
      setState(() {
          dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(dateTime.hour.toString() + ":" + minutes(),
      style: MyTextStyle.estilo(25, MyColors.text),)
    );
  }


  String minutes(){
    if( dateTime.minute < 10){
      return "0" + dateTime.minute.toString();
    }else{
    return dateTime.minute.toString();
    }
  }
}
