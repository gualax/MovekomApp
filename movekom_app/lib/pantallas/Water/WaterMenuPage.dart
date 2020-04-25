


import 'package:flutter/material.dart';
import 'package:movekomapp/pantallas/Water/WaterBoilerView.dart';
import 'package:movekomapp/pantallas/Water/WaterLevelsView.dart';

class WaterMenuPage extends StatefulWidget {
  @override
  _WaterMenuPageState createState() => _WaterMenuPageState();
}

class _WaterMenuPageState extends State<WaterMenuPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.blueGrey,
          margin: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  //       color: Colors.yellowAccent,
                  child: show(_currentIndex, context),
                ),
              ),
              Expanded(
                child: Container(
                  //  color: Colors.blueGrey,
                  child: buttonTabTextMenu(),
                ),
              )
            ],
          )
      ),
    );
  }


  Widget show(int index, context) {
    List<Widget> _children = [
      WaterLevelsView(),
      WaterBoilerView(),
    ];
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 200, left: 200),
        //color: Colors.yellowAccent,
        child: TabBar(
          onTap: (index) {
            changePage(index);
          },
          indicatorColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightGreenAccent,
          tabs: [
            Tab(text: "NIVELES"),
            Tab(text: "BOILER"),
          ],
        ),
      ),
    );
  }


  changePage(int index) {
    setState(() {
      _currentIndex = index;
      print("index is : " + index.toString());
    });
  }


}



