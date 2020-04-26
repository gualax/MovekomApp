
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/stopwatch_bloc.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BateriaMotor2 extends StatelessWidget {
  int widgetType;
  BateriaMotor2(this.widgetType);

  @override
  Widget build(BuildContext context) {
    final stopwatchBloc = BlocProvider.of<StopwatchBloc>(context);

    if(widgetType == 1){
      return bat_chico(stopwatchBloc);
    }else{
      return bat_grande(stopwatchBloc);
    }
  }



  Widget bat_chico(stopwatchBloc){
   return  BlocBuilder(
        bloc: stopwatchBloc,
        builder: (BuildContext context, StopwatchState state) {
          return Container(
            margin: EdgeInsets.all(7),
            width: 137,
            height: 137,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          state.timeFormated,
                          style: MyTextStyle.estiloBold(25, Colors.white)),
                    )
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child:
                    IconButton(
                        icon: Icon(Icons.power_settings_new),
                        iconSize: 30,
                        color: Colors.blue,
                        onPressed: () {
                          if (state.isRunning) {
                            stopwatchBloc.dispatch(StopStopwatch());
                          } else {
                            stopwatchBloc.dispatch(StartStopwatch());
                          }
                        }
                    ),
                    //  }
                    //),
                  ),
                )
              ],
            ),

          );
        }
    );
  }



  Widget bat_grande(stopwatchBloc){
   return  BlocBuilder(
        bloc: stopwatchBloc,
        builder: (BuildContext context, StopwatchState state) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 200,
            height: 214,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          state.timeFormated,
                          style: MyTextStyle.estiloBold(25, Colors.white)),
                    )
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child:
                    IconButton(
                        icon: Icon(Icons.power_settings_new),
                        iconSize: 30,
                        color: Colors.blue,
                        onPressed: () {
                          if (state.isRunning) {
                            stopwatchBloc.dispatch(StopStopwatch());
                          } else {
                            stopwatchBloc.dispatch(StartStopwatch());
                          }
                        }
                    ),
                    //  }
                    //),
                  ),
                )
              ],
            ),

          );
        }
    );
  }

  }






