


import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:movekomapp/bluetooth/BackgroundDataProcesor.dart';

import 'BackGroundData2.dart';


class BluetoothClient {
  static final clientID = 0;
  static  BluetoothConnection connection;
  static  BluetoothDevice server;
  bool inProgress;
  bool isConnecting = true;
  static bool get isConnected => connection != null && connection.isConnected;
  bool isDisconnecting = false;
  BackgroundDataProcessor backgroundDataProcessor;
  BluetoothClient(BuildContext context){
    print("BluetoothClient : SI VES ESTA LINEA MAS DE UNA VEZ HAY ALGO MAL");
    backgroundDataProcessor = BackgroundDataProcessor(context);

  }

   Future <bool> initialize(BluetoothDevice server) async {
     BluetoothConnection.toAddress(server.address).then((_connection) {
       print('Connected to the device');
       connection = _connection;
       connection.input.listen(_onDataReceived).onDone(() {
         // Example: Detect which side closed the connection
         // There should be `isDisconnecting` flag to show are we are (locally)
         // in middle of disconnecting process, should be set before calling
         // `dispose`, `finish` or `close`, which all causes to disconnect.
         // If we except the disconnection, `onDone` should be fired as result.
         // If we didn't except this (no flag set), it means closing by remote.
         if (isDisconnecting) {
           print('Disconnecting locally!');
         } else {
           print('Disconnected remotely!');
         }
       });
       return connection.isConnected;
     }).catchError((error) {
       print('Cannot connect, exception occured');
       print(error);
       return false;
     });
   }

   Future<BluetoothConnection> connect(BluetoothDevice server) async {
    connection = await BluetoothConnection.toAddress(server.address);
    connection.input.listen(_onDataReceived).onDone(() {
      // Example: Detect which side closed the connection
      // There should be `isDisconnecting` flag to show are we are (locally)
      // in middle of disconnecting process, should be set before calling
      // `dispose`, `finish` or `close`, which all causes to disconnect.
      // If we except the disconnection, `onDone` should be fired as result.
      // If we didn't except this (no flag set), it means closing by remote.
      if (isDisconnecting) {
        print('Disconnecting locally!');
      } else {
        print('Disconnected remotely!');
      }
    });
    return connection;
  }


   void _onDataReceived(Uint8List data) {
    print("_onDataReceived");
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print(data);
    print(hex.encode(data));
    backgroundDataProcessor.processData(data);
    //print(hex.decode(data.toString())
    /// esta linea se muestra lo que necesito y ademas al final 0d0a que es salto de linea y fin de linea
    // Allocate buffer for parsed data
    // Create message if there is new line character
  }




  static void sendData(List <int> data) async {
    print("BluetoothClient // sendData");
    var messageHex = Uint8List.fromList(data);
    print(hex.encode(messageHex));
    if (data.length > 0) {
        //    connection.output.add(utf8.encode(text + "\r\n")); // for texts
        connection.output.add(messageHex);
        await connection.output.allSent;
        //setState(() {
          //messages.add(_Message(clientID, text));
        //});
    }
  }

  Future<void> start() async {
    inProgress = true;
    await connection.output.allSent;
  }

  Future<void> cancel() async {
    inProgress = false;
    await connection.finish();
  }

}