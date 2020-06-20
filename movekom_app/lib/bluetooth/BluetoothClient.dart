


import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';


class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class BluetoothClient {
  static final clientID = 0;
  static  BluetoothConnection connection;
  static  BluetoothDevice server;

  List<_Message> messages = List<_Message>();
  String _messageBuffer = '';
  bool isConnecting = true;
  static bool get isConnected => connection != null && connection.isConnected;
  bool isDisconnecting = false;

   bool initialize(BluetoothDevice server) {
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
       return true;
     }).catchError((error) {
       print('Cannot connect, exception occured');
       print(error);
       return false;
     });
   }



  static void _onDataReceived(Uint8List data) {
    print("_onDataReceived");
    print(hex.encode(data));
    /// esta linea se muestra lo que necesito y ademas al final 0d0a que es salto de linea y fin de linea
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    print(hex.encode(buffer));
    int bufferIndex = buffer.length;
    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create message if there is new line character
  }




  static void sendData(List <int> elems2) async {
    print("BluetoothClient // sendData");
    //print("text :" + text);

    //text = text.trim();
    var  boiler = 0x50;
    var status  = 0x50;
    var temp = 0x33;

    List <int> elems =[
      boiler,
      status,
      temp,
    ];

    var messageHex = Uint8List.fromList(elems2);
    print(hex.encode(messageHex));
    if (elems2.length > 0) {
        //    connection.output.add(utf8.encode(text + "\r\n")); // for texts
        connection.output.add(messageHex);
        await connection.output.allSent;
        //setState(() {
          //messages.add(_Message(clientID, text));
        //});
    }
  }

}