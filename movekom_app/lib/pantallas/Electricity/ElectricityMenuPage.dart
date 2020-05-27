import 'package:flutter/material.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityDataView.dart';
import 'package:movekomapp/pantallas/Reles/ElectricityReleView.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityStateView.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';


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
        body: MyContainer(
         // color: Colors.blueGrey,
          margin: EdgeInsets.only(top: 25),
          child: Column(
          children: <Widget>[
              Expanded(
                flex: 7,
                child: MyContainer(
           //       color: Colors.yellowAccent,
                  child: show(_currentIndex, context),
                ),
              ),
            Expanded(
              child: MyContainer(
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
    ];
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: MyContainer(
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
