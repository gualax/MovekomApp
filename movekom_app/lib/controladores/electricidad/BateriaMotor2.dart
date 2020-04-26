
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/stopwatch_bloc.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BateriaMotor2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchBloc = BlocProvider.of<StopwatchBloc>(context);

    return  BlocBuilder(
         bloc: stopwatchBloc,
         builder: (BuildContext context, StopwatchState state) {
           return Container(
             margin: EdgeInsets.all(7),
             width: 137, height: 137,
             decoration: new BoxDecoration(
                 color: Color(0xff2d3033)
             ),
             child: Stack(
               children: <Widget>[
                 Positioned.fill(
                     child: Align(
                       alignment: Alignment.center,
                       child: Text(
                           state.timeFormated, style: MyTextStyle.estiloBold(25, Colors.white)),
                     )
                 ),
                 Positioned.fill(
                     child:Align(
                       alignment: Alignment.bottomRight,
                   child: BlocBuilder(
                     bloc: stopwatchBloc,
                     builder: (BuildContext context, StopwatchState state) {
                       return IconButton (
                       icon: Icon(Icons.power_settings_new), iconSize: 30,
                        color: Colors.blue,
                         onPressed: (){
                         if(state.isRunning){
                           stopwatchBloc.dispatch(StopStopwatch());
                         }else{
                           stopwatchBloc.dispatch(StartStopwatch());
                         }
                         }
                       );
                     }
                   ),
                 ))
               ],
             ),

           );
         }
    );
  }
}




