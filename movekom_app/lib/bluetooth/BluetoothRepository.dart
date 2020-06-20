

import 'package:movekomapp/bluetooth/BluetoothClient.dart';

class BluetoothRepository {

 static Future sendData(List<int> data) async {
    print("BluetoothRepository // sendData");
    if(BluetoothClient.isConnected){
      return BluetoothClient.sendData(data);
    } else {
      print("BLUETOOTH NO CONECTADO");
    }
  }
}
