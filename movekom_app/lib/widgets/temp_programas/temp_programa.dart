

import 'package:flutter/material.dart';

class TimerProgram {
/*
  int id;
  TimeOfDay horaDesde;
  bool statusDesde;
  bool statusHasta;
  TimeOfDay horaHasta;
  DayPeriod dias;
 */
  TimeOfDay horaHasta;
  TimeOfDay horaDesde;
  int temperature;
  List<String> daysList;

  TimerProgram(){
    this.temperature = 20;
    this.daysList = new List();
    this.horaDesde = new TimeOfDay(hour: 10, minute:00);
    this.horaHasta = new  TimeOfDay(hour: 10, minute:00);
  }


}