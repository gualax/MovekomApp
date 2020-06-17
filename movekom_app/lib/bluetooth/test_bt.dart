import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'BackgroundCollectingTask.dart';
import 'ChatPage.dart';
import 'SelectBondedDevicePage.dart';

class TestBtPage extends StatefulWidget {
  @override
  _TestBtPageState createState() => _TestBtPageState();
}

class _TestBtPageState extends State<TestBtPage> {

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  String _address = "...";
  String _name = "...";

  Timer _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  BackgroundCollectingTask _collectingTask;

  bool _autoAcceptPairingRequests = false;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    _collectingTask?.dispose();
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            btSettings(),
            btComunicationVisor(),
          ],
        )
     //   child:
      ),
    );
  }


  Widget btSettings(){
   return Expanded(
     child: MyContainer(
       margin: EdgeInsets.all(SC.all(10)),
       color: MyColors.baseColor,
       child: ListView(
         children: <Widget>[
           SwitchListTile(
             title:  Text('Enable Bluetooth',
               style: MyTextStyle.estiloBold(14, MyColors.text)),
             value: _bluetoothState.isEnabled,
             onChanged: (bool value) {
               // Do the request and update with the true value then
               future() async {
                 // async lambda seems to not working
                 if (value)
                   await FlutterBluetoothSerial.instance.requestEnable();
                 else
                   await FlutterBluetoothSerial.instance.requestDisable();
               }

               future().then((_) {
                 setState(() {});
               });
             },
           ),
           ListTile(
             title:  Text('Bluetooth status',
                 style: MyTextStyle.estiloBold(14, MyColors.text)),
             subtitle: Text(_bluetoothState.toString(),
                 style: MyTextStyle.estiloBold(14, MyColors.text)),
             trailing: RaisedButton(
               child:  Text('Settings',
                   style: MyTextStyle.estiloBold(14,Colors.black)),
               onPressed: () {
                 FlutterBluetoothSerial.instance.openSettings();
               },
             ),
           ),
           ListTile(
             title: RaisedButton(
               child:  Text('Connect to paired device to chat',
                   style: MyTextStyle.estiloBold(14, Colors.black)),
               onPressed: () async {
                 final BluetoothDevice selectedDevice =
                 await Navigator.of(context).push(
                   MaterialPageRoute(
                     builder: (context) {
                       return SelectBondedDevicePage(checkAvailability: false);
                     },
                   ),
                 );

                 if (selectedDevice != null) {
                   print('Connect -> selected ' + selectedDevice.address);
                   _startChat(context, selectedDevice);
                 } else {
                   print('Connect -> no device selected');
                 }

               },
             ),
           ),
         ],
       ),
     ),
   );
  }

  Widget btComunicationVisor(){
    return Expanded(
      child: MyContainer(
      margin: EdgeInsets.all(SC.all(10)),
      color: MyColors.baseColor,
      ),
    );
  }


  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChatPage(server: server);
        },
      ),
    );
  }

  Future<void> _startBackgroundTask(
      BuildContext context,
      BluetoothDevice server,
      ) async {
    try {
      _collectingTask = await BackgroundCollectingTask.connect(server);
      await _collectingTask.start();
    } catch (ex) {
      if (_collectingTask != null) {
        _collectingTask.cancel();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error occured while connecting'),
            content: Text("${ex.toString()}"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}