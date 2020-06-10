import 'package:flutter/material.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterCalefactionView.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterHistoryView.dart';


class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage>  with SingleTickerProviderStateMixin  {
  int _currentIndex=0;
  TabController _tabController;

  List<Widget> _children = [
    WheaterCalefactionView(),
    WheaterHistoryView(),
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
          ),
      );
  }



  Widget show(int index, context) {
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
          controller: _tabController,
          indicatorColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightGreenAccent,
          tabs: [
            Tab(text: "GENERAL"),
            Tab(text: "HISTORIAL"),
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