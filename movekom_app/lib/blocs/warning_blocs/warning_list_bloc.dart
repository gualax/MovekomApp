
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/averias/averias.dart';

class WarningListItemBloc {


  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  ///
  final warningListStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getWarninfListStream => warningListStreamController.stream;


  List<Averia> warningList = [
    Averia(title:"AVERIA CALEFACTOR F12" ),
    Averia(title:"BAJO VOLTAJE EN BATERIA 1" ),
    Averia(title:"ALTO VOLTAJE EN BATERIA 2" ),
    Averia(title:"BOILER DESCONECTADO" ),
  ];

  void add(item) {
    warningList.add(item);
    warningListStreamController.sink.add(warningList);
  }

  void remove(item) {
    print("REMOVE");
    print(item);
    warningList.remove(item);
    warningListStreamController.sink.add(warningList);
  }

  void removeFromIndex(int index) {
    warningList.remove(warningList[index]);
    warningListStreamController.sink.add(warningList);
  }
  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    warningListStreamController.close(); // close our StreamController
  }

}

final bloc = WarningListItemBloc();


