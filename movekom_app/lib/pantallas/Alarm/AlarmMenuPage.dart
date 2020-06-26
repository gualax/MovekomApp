import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/pantallas/Alarm/AlarmGeneralView.dart';
import 'package:movekomapp/pantallas/Alarm/AlarmSettingsView.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';


class AlarmMenuPage extends StatefulWidget {
  @override
  _AlarmMenuPageState createState() => _AlarmMenuPageState();
}

class _AlarmMenuPageState extends State<AlarmMenuPage> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  List<Widget> _children = [
    AlarmGeneralView(),
    AlarmSettingsView(),
  ];
  TabController _tabController;
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
    print("build/_AlarmMenuPageState");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: MyContainer(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: MyContainer(
                  //       color: Colors.yellowAccent,
                  child: new TabBarView(
                    controller: _tabController,
                    children: _children,
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  //      color: Colors.blueGrey,
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
            Tab(text: "GENERAL"),
            Tab(text: "AJUSTES"),
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
