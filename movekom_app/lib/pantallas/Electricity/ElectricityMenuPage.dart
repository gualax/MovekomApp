import 'package:flutter/material.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityDataView.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricitySettingsView.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityStateView.dart';


class ElectricityPage extends StatefulWidget {
  @override
  _ElectricityPageState createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
      ElectricityStateView(),
      ElectricityDataView(),
      ElectricitySettingsView(),
    ];
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 3,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 100, left: 100),
        //color: Colors.yellowAccent,
        child: TabBar(
          onTap: (index) {
            changePage(index);
          },
          indicatorColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightGreenAccent,
          tabs: [
            Tab(text: "ESTADO"),
            Tab(text: "DATOS"),
            Tab(text: "AJUSTE"),
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
