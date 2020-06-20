



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/bluetooth/BluetoothClient.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'SelectBondedDevicePage.dart';
import 'bluetooth_bloc.dart';

class BluetoothController extends StatefulWidget {
  @override
  _BluetoothControllerState createState() => _BluetoothControllerState();
}

class _BluetoothControllerState extends State<BluetoothController> {

  BuildContext mContext;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothControllerBloc  _bluetoothControllerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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

    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _bluetoothControllerBloc = BlocProvider.of<BluetoothControllerBloc>(context);
    _bluetoothControllerBloc.add(Start(_bluetoothState.isEnabled));
    return _bluetooth();
  }

  Widget _bluetooth() {
    Color colorImg, colorText;
    bool isConnected = false;
    return
      BlocBuilder<BluetoothControllerBloc,BluetoothControllerState> (
        builder: ( context, state) {
        if(state.isEnabled){
          colorText = MyColors.text;
          colorImg = MyColors.principal;
        }else{
          colorImg = MyColors.inactive;
          colorText = MyColors.inactive;
        }
       return GestureDetector(
         onTap: () {
           print("onPressed");
           print(_bluetoothState.isEnabled);
           if (_bluetoothState.isEnabled) {
             _bluetoothControllerBloc.add(Disable());
             FlutterBluetoothSerial.instance.requestDisable();
           }
           else {
             _bluetoothControllerBloc.add(Enable());
             FlutterBluetoothSerial.instance.requestEnable();
           }
         },
         child: MyContainer(
           margin: EdgeInsets.all(SC.all(5)),
           height: 190,
         width: 390,
         decoration: new BoxDecoration(
            color: MyColors.baseColor
      ),
      child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                left: 15,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD("assets/icons/bluetooth_icon.svg", colorImg, 90),
                )
            ),
            MyPositioned.fill(
                left: 10, top: 5,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Bluetooth",
                    style: MyTextStyle.estiloBold(20, colorText),),
                )
            ),
            MyPositioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/on_off.svg",colorImg , 30),
                )
            ),
            MyPositioned.fill(
                right: 100,  bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Nombre",
                    style: MyTextStyle.estilo(14, colorText),),
                )
            ),
            MyPositioned.fill(
                left: 50, bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Clave",
                    style: MyTextStyle.estilo(14, colorText),),
                )
            ),
            MyPositioned.fill(
                left: 190,  bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Estado",
                    style: MyTextStyle.estilo(14, colorText),),
                )
            ),
            MyPositioned.fill(
                right: 15, top: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(15.0, colorImg),
                )
            ),
            MyPositioned.fill(
                right: 15, bottom: 10,
                child: Align (
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
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
                        //startChat(context, selectedDevice);
                        _bluetoothControllerBloc.add(SetDevice(selectedDevice));
                        BluetoothClient bluClient = new   BluetoothClient();
                        setState(() {
                          isConnected =   bluClient.initialize(selectedDevice);
                        });
                      } else {
                        print('Connect -> no device selected');
                      }

                    },
                    child: MyContainer(
                      height: 50,
                      width: 100,
                      decoration: new BoxDecoration(
                          color: Colors.white12
                      ),
                        child: Center(
                            child: Text(isConnected ? "Connected" : "Connect",
                                style: MyTextStyle.estiloBold(14, Colors.white))
                        ),
                    )
                  ),
                )
            ),
          ],
          ),
      ),
       );
     }
    );
  }




}
