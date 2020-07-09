import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/alarma_blocs/alarma_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'SC.dart';

class AlarmDialog extends StatefulWidget {

  bool mode;
  AlarmDialog(this.mode);

  @override
  _AlarmDialogState createState() => _AlarmDialogState();
}

class _AlarmDialogState extends State<AlarmDialog> {
  AlarmaBloc alarmaBloc;

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
    if(widget.mode) {
      startTimer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    alarmaBloc = BlocProvider.of<AlarmaBloc>(context);

    return alarm_dialog();
  }


  Widget alarm_dialog(){
   return new AlertDialog(
        backgroundColor: MyColors.baseColor,
        content:
        widget.mode ? Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
        child: _start > 0 ? Stack(
            children: <Widget>[
              MyPositioned.fill(
                right: 100, top: 100,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text("ACTIVANDO ALARMA",style: MyTextStyle.estiloBold(50, MyColors.white),),
                  )
              ),
              MyPositioned.fill(
                   top: 100,left: 400,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("RETARDO $_start seg",style: MyTextStyle.estiloBold(45, MyColors.white),),
                  )
              ),
              MyPositioned.fill(
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
            MyPositioned.fill(
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
            MyPositioned.fill(
                left: 150,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD( "assets/icons/shield.svg", MyColors.principal, 370),
                )
            ),
          ],
        )
      )
            :
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 600,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      right: 100, top: 100,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text("DESACTIVAR ALARMA",style: MyTextStyle.estiloBold(50, MyColors.white),),
                      )
                  ),
                  MyPositioned.fill(
                      left: 150,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD( "assets/icons/shield.svg", MyColors.principal, 370),
                      )
                  ),
                  MyPositioned.fill(
                      top: 85,left: 200,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("PIN",style: MyTextStyle.estiloBold(45, MyColors.white),),
                      )
                  ),
                  MyPositioned.fill(
                      top: 100,left: 500,
                      child: Align(
                        child: MyContainer(
                          height: 80,
                          width: 200,
                          child: TextField(
                            style: MyTextStyle.estiloBold(17, Colors.white),
                            focusNode: FocusNode(),
                            textAlign: TextAlign.center,
                            maxLength: 14,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: new InputDecoration(
                              counterText: '',
                              counterStyle: TextStyle(fontSize: 0),
                              hintText: 'XXXXX',
                              hintStyle: MyTextStyle.estiloBold(17, Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.principal, width: SC.wid(2)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: SC.wid(2)),
                              ),
                            ),
                          ),
                        ) ,
                      )
                  ),
                  MyPositioned.fill(
                    bottom: 50,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: (){
                              alarmaBloc.add(Disable());
                              Navigator.of(context).pop();
                            },
                            child: MyContainer(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: MyColors.principal,
                                    width: SC.all(4)
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(SC.all(30))),
                              ),
                              child: Center(
                                child: Text("ACEPTAR",
                                  style: MyTextStyle.estiloBold(26, MyColors.text),),
                              ),
                            ),
                          )
                      )
                  ),
                ],
              ),
              ),
            ),
    );
  }
}
