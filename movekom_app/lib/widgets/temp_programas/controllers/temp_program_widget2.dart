
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/timer_utils.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/temp_programas/blocs/general_timer_dialog_bloc.dart';
import 'package:movekomapp/widgets/temp_programas/blocs/temp_program_bloc2.dart';
import '../../IconSvg.dart';
import '../temp_programa.dart';

class TimerProgramWidget2 extends StatefulWidget {
  int widgetType;

  TimerProgramWidget2(this.widgetType);

  @override
  _TimerProgramWidget2State createState() => _TimerProgramWidget2State();
}

class _TimerProgramWidget2State extends State<TimerProgramWidget2> {
  String title = "PROGRAMA 2";
  List<String> daysAdded = new List();
  TimerProgram2Bloc bloc;
  TimerProgram timerProgram;
  GeneralTimerProgramBloc _generalTimerProgramBloc;
  int index = 2;
  TimeOfDay startTimeDesde =  TimeOfDay(hour: 10, minute: 00);
  TimeOfDay startTimeHasta =  TimeOfDay(hour: 10, minute: 00);

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<TimerProgram2Bloc>(context);
    _generalTimerProgramBloc = BlocProvider.of<GeneralTimerProgramBloc>(context);

    if (widget.widgetType == 1) {
      return timer_program_widget();
    } else {
      return timer_program_big();
    }
  }


  Widget timer_program_widget() {
    Color colorIcon, colorText;
    return BlocBuilder<TimerProgram2Bloc, TimerProgram2State>(
        condition: (previousState, state) {
          return previousState.saved != state.saved;
        },
        builder: (context, state) {
          print(state.timerProgram.daysList);
          if (state.isEnabled) {
            colorIcon = MyColors.principal;
            colorText = MyColors.text;
          } else {
            colorIcon = MyColors.white;
            colorText = MyColors.inactive;
          }
          return GestureDetector(
            onTap: () {
              _generalTimerProgramBloc.add(UpdateGeneral(index));
            },
            child: MyContainer(
              margin: EdgeInsets.only(top: SC.top(10), bottom: SC.bot(10)),
              height: 118.00,
              width: 289.00,
              color: MyColors.baseColor,
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      left: 10,
                      top: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: MyTextStyle.estiloBold(18, colorText),
                        ),
                      )),
                  MyPositioned.fill(
                      left: 10, top:30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyContainer(
                          height: 30,
                          width: 140,
                          //   color: Colors.pink,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: daysStr.length,
                              itemBuilder: (context, index) {
                                final item = daysStr[index];
                                return Center(
                                  child: Text(
                                    item,
                                    style: MyTextStyle.estiloBold(
                                        15,
                                        state.isEnabled ?
                                        state.timerProgram.daysList.contains(item)
                                            ? MyColors.principal
                                            : MyColors.text : colorText),
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: 5,
                                );
                              }),
                        ),
                      )),
                  MyPositioned.fill(
                      left: 10,
                      bottom: 25,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.timerProgram.horaHasta.hour.toString() + ":" + state.timerProgram.horaHasta.minute.toString() ,
                          style: MyTextStyle.estilo(15, colorText),
                        ),
                      )
                  ),
                  MyPositioned.fill(
                      left: 60,
                      bottom: 25,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.timerProgram.horaDesde.hour.toString() + ":" + state.timerProgram.horaDesde.minute.toString() ,
                          style: MyTextStyle.estilo(15, colorText),
                        ),
                      )
                  ),
                  MyPositioned.fill(
                      right: 30,
                      top: 30,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.timerProgram.temperature.toString() + "ºC",
                          style: MyTextStyle.estiloBold(28, colorText),
                        ),
                      )),
                  MyPositioned.fill(
                      top: 10,
                      right: 10,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: iconSvgD(
                              Constants.ON_OFF_ICON_ROUTE, colorIcon, 25))),
                ],
              ),
            ),
          );
        });
  }

  Widget timer_program_big() {
    Color colorIcon;
    return BlocBuilder<TimerProgram2Bloc, TimerProgram2State>(
        builder: (context, state) {
          timerProgram = state.timerProgram;
          if (state.isEnabled) {
            colorIcon = MyColors.principal;
          } else {
            colorIcon = MyColors.white;
          }
          return MyContainer(
            height: 394.00,
            width: 482.00,
            color: MyColors.baseColor,
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                    left: 10,
                    top: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: MyTextStyle.estiloBold(18, MyColors.text),
                      ),
                    )),
                MyPositioned.fill(
                    top: 70,
                    right: 20,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: boxTimeSeterDesde(),
                    )),
                MyPositioned.fill(
                    top: 70,
                    left: 20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: boxTimeSeterHasta(),
                    )),
                MyPositioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: MyContainer(
                        height: 50,
                        width: 180,
                        // color: Colors.pink,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: daysStr.length,
                            itemBuilder: (context, index) {
                              final item = daysStr[index];
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (daysAdded.contains(item)) {
                                      //state.timerProgram.daysList.remove(item);
                                      daysAdded.remove(item);
                                      //    state.timerProgram.daysList = daysAdded;
                                      //    bloc.add(Update(timerProgram));
                                    } else {
                                      daysAdded.add(item);
                                      //        state.timerProgram.daysList.add(item);
                                      //    bloc.add(Update(timerProgram));
                                    }
                                    state.timerProgram.daysList = daysAdded;
                                    bloc.add(Update(timerProgram));
                                    setState(() {});
                                  },
                                  child: Text(
                                    item,
                                    style: MyTextStyle.estiloBold(
                                        25,
                                        daysAdded.contains(item)
                                            ? MyColors.principal
                                            : MyColors.text),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            }),
                      ),
                    )),
                MyPositioned.fill(
                    top: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        state.timerProgram.temperature.toString() + "ºC",
                        style: MyTextStyle.estiloBold(28, MyColors.text),
                      ),
                    )),
                MyPositioned.fill(
                  top: 150,
                  left: 150,
                  child: Align(
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        splashColor: MyColors.inkSplashColor,
                        onTap:() {
                          setState(() {
                            timerProgram.temperature ++;
                            bloc.add(Update(timerProgram));
                          });
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: MyColors.text,
                          size: SC.all(30),
                        ),
                      ),
                    ),
                  ),
                ),
                MyPositioned.fill(
                  top: 150,
                  right: 150,
                  child: Align(
                    alignment: Alignment.center,
                    child:Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        splashColor: MyColors.inkSplashColor,
                        onTap:() {
                          setState(() {
                            timerProgram.temperature --;
                            bloc.add(Update(timerProgram));
                          });
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: MyColors.text,
                          size: SC.all(30),
                        ),
                      ),
                    ),
                  ),
                ),
                MyPositioned.fill(
                    left: 10,
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          // customBorder: CircleBorder(),
                          splashColor: MyColors.inkSplashColor,
                          onTap: (){
                            if(state.saved)
                              bloc.add(Save(false));
                            else
                              bloc.add(Save(true));
                          },
                          child: Container(
                            child: Text(
                              "GUARDAR",
                              style: MyTextStyle.estiloBold(20, MyColors.text),
                            ),
                          ),
                        ),
                      ),
                    )),
                MyPositioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          bloc.add(Update(timerProgram));
                          if (state.isEnabled) {
                            bloc.add(Disable());
                          } else {
                            bloc.add(Enable());
                          }
                          print(state.isEnabled);
                        },
                        child: Text(
                          state.isEnabled ? "ACTIVADO" : "ACTIVAR",
                          style: MyTextStyle.estiloBold(20,colorIcon),
                        ),
                      ),
                    )),
                MyPositioned.fill(
                    right: 10,
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "BORRAR",
                        style: MyTextStyle.estiloBold(20, MyColors.text),
                      ),
                    )),
              ],
            ),
          );
        });
  }


  Widget boxTimeSeterDesde() {
    return MyContainer(
      height: 100,
      width: 150,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  splashColor: MyColors.inkSplashColor,
                  onTap:() {
                    setState(() {
                      startTimeDesde = incrementTime(startTimeDesde);
                      timerProgram.horaDesde  = startTimeDesde;
                    });
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: MyColors.text,
                    size: SC.all(30),
                  ),
                ),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "ON",
                style: MyTextStyle.estiloBold(20, MyColors.text),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                startTimeDesde.minute < 10?
                startTimeDesde.hour.toString() + ":0" + startTimeDesde.minute.toString() :
                startTimeDesde.hour.toString() + ":" +  startTimeDesde.minute.toString(),
                style: MyTextStyle.estilo(17, MyColors.text),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  splashColor: MyColors.inkSplashColor,
                  onTap:() {
                    setState(() {
                      print("horaDesde");
                      startTimeDesde = decrementTime(startTimeDesde);
                      timerProgram.horaDesde  = startTimeDesde;
                    });
                  },
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: MyColors.text,
                    size: SC.all(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget boxTimeSeterHasta() {
    return MyContainer(
      height: 100,
      width: 150,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  splashColor: MyColors.inkSplashColor,
                  onTap:() {
                    setState(() {
                      startTimeHasta = incrementTime(startTimeHasta);
                      timerProgram.horaHasta  = startTimeHasta;
                    });
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: MyColors.text,
                    size: SC.all(30),
                  ),
                ),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "ON",
                style: MyTextStyle.estiloBold(20, MyColors.text),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                startTimeHasta.minute < 10?
                startTimeHasta.hour.toString() + ":0" + startTimeHasta.minute.toString() :
                startTimeHasta.hour.toString() + ":" +  startTimeHasta.minute.toString(),
                style: MyTextStyle.estilo(17, MyColors.text),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  splashColor: MyColors.inkSplashColor,
                  onTap:() {
                    setState(() {
                      startTimeHasta = decrementTime(startTimeHasta);
                      timerProgram.horaHasta  = startTimeHasta;
                    });
                  },
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: MyColors.text,
                    size: SC.all(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> daysStr = [
    "L",
    "M",
    "X",
    "J",
    "V",
    "S",
    "D",
  ];
}
