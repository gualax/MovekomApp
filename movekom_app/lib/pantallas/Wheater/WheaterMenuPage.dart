import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterCalefactionView.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterDataView.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.black,
          body:  Container(
            // color: Colors.blueGrey,
              margin: EdgeInsets.only(top: 10),
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
      WheaterCalefactionView(),
      WheaterDataView(),
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
            Tab(text: "GENERAL"),
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