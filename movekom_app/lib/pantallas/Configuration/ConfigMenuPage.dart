
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/bluetooth/BluetoothController.dart';

class ConfigMenuPage extends StatefulWidget {
  @override
  _ConfigMenuPageState createState() => _ConfigMenuPageState();
}

class _ConfigMenuPageState extends State<ConfigMenuPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: BluetoothController(),
      ),
    );
  }


}