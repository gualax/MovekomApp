import 'package:flutter/material.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterHistoryView.dart';

import 'WheaterGeneralView.dart';

class WheatherGeneralPage extends StatefulWidget {
  @override
  _WheatherGeneralPageState createState() => _WheatherGeneralPageState();
}

class _WheatherGeneralPageState extends State<WheatherGeneralPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black,
      body: Container(
       child: show(_currentIndex),
      ),
    );
  }

  Widget show(int index) {
    return _children[index];
  }

  List<Widget> _children = [
    WheaterCalefactionView(),
    WheaterHistoryView(),
  ];

}
