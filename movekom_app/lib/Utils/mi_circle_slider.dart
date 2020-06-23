import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';

class MyCircleSlider extends StatefulWidget {
  @override
  _MyCircleSliderState createState() => _MyCircleSliderState();
}

class _MyCircleSliderState extends State<MyCircleSlider> {

  int initTime;
  int endTime;

  int inBedTime;
  int outBedTime;
  int days = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initTime = _generateRandomTime();
      endTime = _generateRandomTime();
      inBedTime = initTime;
      outBedTime = endTime;
    });
  }
  @override
  Widget build(BuildContext context) {
    return circularSlider();
  }


  Widget circularSlider() {
    return

      //Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
     // children: [
         SingleCircularSlider(
           288,
           endTime,
         //    endTime,
           height: 200.0,
           width: 200.0,
           primarySectors: 6,
           secondarySectors: 24,
           baseColor: Color.fromRGBO(255, 255, 255, 0.1),
          // selectionColor: Colors.blue,
           handlerColor: Colors.lightGreenAccent,
           handlerOutterRadius: 40.0,
           onSelectionChange: _updateLabels,
           showRoundedCapInSelection: true,
           showHandlerOutter: true,
           //child: flechaIndicador(40, 20),
           /*
           child: Padding(
               padding: const EdgeInsets.all(42.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 20),
                   Text('${_formatIntervalTime(inBedTime, outBedTime)}',
                       style: TextStyle(fontSize: 24.0, color: Colors.white)),
                   Text('${_formatDays(days)}',
                       style: TextStyle(
                           fontSize: 16.0,
                           color: Colors.white,
                           fontStyle: FontStyle.italic)),
                 ],
               )),
               /
            */
           shouldCountLaps: true,
         );
   /*
        DoubleCircularSlider(
          288,
          initTime,
          endTime,
          height: 260.0,
          width: 260.0,
          primarySectors: 6,
          secondarySectors: 24,
          baseColor: Color.fromRGBO(255, 255, 255, 0.1),
          selectionColor: Colors.blue,
          handlerColor: Colors.white,
          handlerOutterRadius: 12.0,
          onSelectionChange: _updateLabels,
          onSelectionEnd: (a, b, c) => print('onSelectionEnd $a $b $c'),
          sliderStrokeWidth: 12.0,
          child: Padding(
              padding: const EdgeInsets.all(42.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text('${_formatIntervalTime(inBedTime, outBedTime)}',
                      style: TextStyle(fontSize: 36.0, color: Colors.white)),
                  Text('${_formatDays(days)}',
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ],
              )),
          shouldCountLaps: true,
        ),


        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _formatBedTime('IN THE', inBedTime),
          _formatBedTime('OUT OF', outBedTime),
        ]),


        FlatButton(
          child: Text('S H U F F L E'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: _shuffle,
        ),

    */
    //  ],
    //);
}
  void _shuffle() {
    setState(() {
      initTime = _generateRandomTime();
      endTime = _generateRandomTime();
      inBedTime = initTime;
      outBedTime = endTime;
    });
  }
  void _updateLabels(int init, int end, int laps) {
    setState(() {
      inBedTime = init;
      outBedTime = end;
      days = laps;
    });
  }
  Widget _formatBedTime(String pre, int time) {
    return Column(
      children: [
        Text(pre, style: TextStyle(color:  Colors.blue)),
        Text('BED AT', style: TextStyle(color:  Colors.blue)),
        Text(
          '${_formatTime(time)}',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  String _formatDays(int days) {
    return days > 0 ? ' (+$days)' : '';
  }

  String _formatTime(int time) {
    if (time == 0 || time == null) {
      return '00:00';
    }
    var hours = time ~/ 12;
    var minutes = (time % 12) * 5;
    return '$hours:$minutes';
  }

  String _formatIntervalTime(int init, int end) {
    var sleepTime = end > init ? end - init : 288 - init + end;
    var hours = sleepTime ~/ 12;
    var minutes = (sleepTime % 12) * 5;
    return '${hours}h${minutes}m';
  }

  int _generateRandomTime() => Random().nextInt(288);

}
