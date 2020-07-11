


import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/pantallas/Water/WaterBoilerView.dart';
import 'package:movekomapp/pantallas/Water/WaterLevelsView.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';

import 'WaterValvesView.dart';

class WaterMenuPage extends StatefulWidget {
  @override
  _WaterMenuPageState createState() => _WaterMenuPageState();
}

class _WaterMenuPageState extends State<WaterMenuPage>  {
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.blueGrey,
         // margin: EdgeInsets.only(top: 25),
       child: WaterLevelsView(),
      ),
    );
  }

}



