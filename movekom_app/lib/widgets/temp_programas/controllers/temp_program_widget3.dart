
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/temp_programas/blocs/general_timer_dialog_bloc.dart';
import 'package:movekomapp/widgets/temp_programas/blocs/temp_program_bloc3.dart';
import '../../IconSvg.dart';
import '../temp_programa.dart';


class TimerProgramWidget3 extends StatefulWidget {
  int widgetType;

  TimerProgramWidget3(this.widgetType);

  @override
  _TimerProgram3Widget3State createState() => _TimerProgram3Widget3State();
}

class _TimerProgram3Widget3State extends State<TimerProgramWidget3> {
  String title = "PROGRAMA 3";
  List<String> daysAdded = new List();
  TimerProgram3Bloc bloc;
  TimerProgram timerProgram;
  GeneralTimerProgramBloc _generalTimerProgramBloc;
  int index = 3;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<TimerProgram3Bloc>(context);
    _generalTimerProgramBloc = BlocProvider.of<GeneralTimerProgramBloc>(context);

    if (widget.widgetType == 1) {
      return timer_program_widget();
    } else {
      return timer_program_big();
    }
  }


  Widget timer_program_widget() {
    Color colorIcon, colorText;
    return BlocBuilder<TimerProgram3Bloc, TimerProgram3State>(
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
                      left: 10, top:20,
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
                                        14,
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
                      bottom: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "10:00 - 10:00",
                          style: MyTextStyle.estilo(15, colorText),
                        ),
                      )),
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
    return BlocBuilder<TimerProgram3Bloc, TimerProgram3State>(
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
                      child: boxTimeSeter(),
                    )),
                MyPositioned.fill(
                    top: 70,
                    left: 20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: boxTimeSeter(),
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



  Widget boxTimeSeter() {
    return MyContainer(
      height: 100,
      width: 150,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.add_circle_outline,
                color: MyColors.text,
                size: SC.all(30),
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
                "10:00",
                style: MyTextStyle.estilo(17, MyColors.text),
              ),
            ),
          ),
          MyPositioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.remove_circle_outline,
                color: MyColors.text,
                size: SC.all(30),
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
