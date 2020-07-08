import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class AlarmDialog extends StatefulWidget {
  @override
  _AlarmDialogState createState() => _AlarmDialogState();
}

class _AlarmDialogState extends State<AlarmDialog> {
  int time;

  Timer _timer;
  Timer _secondTimer;

  int _start = 5;
  int _secondStart = 1;


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
              startSecondTimer();
              timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void startSecondTimer() {
    const oneSec = const Duration(seconds: 1);
    _secondTimer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_secondStart < 1) {
            timer.cancel();
            Navigator.of(context).pop();
          } else {
            _secondStart = _secondStart - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _secondTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return alarm_dialog();
  }


  Widget alarm_dialog(){
   return new AlertDialog(
        backgroundColor: MyColors.baseColor,
        content: Container(
        width: MediaQuery.of(context).size.width,
        child: _start > 0 ? Stack(
            children: <Widget>[
              Positioned.fill(
                right: 100, top: 100,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text("ACTIVANDO ALARMA",style: MyTextStyle.estiloBold(50, MyColors.white),),
                  )
              ),
              Positioned.fill(
                   top: 100,left: 400,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("RETARDO $_start seg",style: MyTextStyle.estiloBold(45, MyColors.white),),
                  )
              ),
              Positioned.fill(
                left: 150,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD( "assets/icons/shield.svg", MyColors.principal, 370),
                  )
              ),
            ],
        )
        :
        Stack(
          children: <Widget>[
            Positioned.fill(
                right: 70,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MyContainer(
                    height: 400,
                    width: 600,
                   child: Text("ALARMA ACTIVADA",
                     style: MyTextStyle.estiloBold(100, MyColors.white),
                    textAlign: TextAlign.center,),
                  ),
                )
            ),
            Positioned.fill(
                left: 150,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD( "assets/icons/shield.svg", MyColors.principal, 370),
                )
            ),
          ],
        )
      ),
    );
  }
}
