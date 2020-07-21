import 'package:flutter/material.dart';

TimeOfDay incrementTime(actualTime){
  if(actualTime.hour == 23 && actualTime.minute == 30  ){
    actualTime = actualTime.replacing(
      hour: 00,
      minute: 00,
    );
  } else {
    actualTime.minute + 30 == 60 ?
    actualTime = actualTime.replacing(
      hour: actualTime.hour + 1,
      minute: 00,
    ) :
    actualTime = actualTime.replacing(
      hour: actualTime.hour,
      minute: actualTime.minute + 30,
    );
  }
  return actualTime;
}


TimeOfDay decrementTime(actualTime){
  if(actualTime.hour == 0 && actualTime.minute == 0  ){
    actualTime = actualTime.replacing(
      hour: 23,
      minute: 30,
    );
  } else {
    actualTime.minute == 00 ?
    actualTime = actualTime.replacing(
      hour: actualTime.hour - 1,
      minute: 30,
    ) :
    actualTime = actualTime.replacing(
      hour: actualTime.hour,
      minute: actualTime.minute - 30,
    );
  }
  return actualTime;
}