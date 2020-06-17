


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

class _WaterMenuPageState extends State<WaterMenuPage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  List<Widget> _children = [
    WaterLevelsView(),
    WaterValvesView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: _children.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.blueGrey,
         // margin: EdgeInsets.only(top: 25),
       child: WaterLevelsView(),
       /*
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  //       color: Colors.yellowAccent,
                  child: new TabBarView(
                      controller: _tabController,
                      children: _children),
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
       */
      ),
    );
  }


  Widget show(int index, context) {
    return _children[index];
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: MyContainer(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: SC.right(200), left: SC.left(200)),
        //color: Colors.yellowAccent,
        child: TabBar(
          onTap: (index) {
            changePage(index);
          },
          controller: _tabController,
          indicatorColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightGreenAccent,
          tabs: [
            Tab(text: "AGUA"),
            Tab(text: "VALVULAS"),
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



