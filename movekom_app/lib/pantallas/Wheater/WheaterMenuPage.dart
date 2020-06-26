import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/animation_slide_effect.dart';
import 'package:movekomapp/Utils/dart_anim.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterGeneralView.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterHistoryView.dart';


class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage>  with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        body: Container(
         //  color: Colors.blueGrey,
       //     margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  
                  child: show(_currentIndex),
                 /*
                  TabBarView(
                 //   physics: NeverScrollableScrollPhysics(), /// Ver si esto ayuda
                    children: _children,
                    controller: _tabController,
                  ),
                  */
                ),
                Expanded(
                  child: Container(
             //         color: Colors.pink,
                    child: buttonTabTextMenu(),
                  ),
                )
              ],
            )
        ),
      );
  }


  Widget show(int index) {
    return _children[index];
  }
  Widget showWithTransition(int index, context){
    print("showWithTransition///");
    return TransitionAnimationSlide(widgetToAnim: _children[index],index: index);
  }


  Widget buttonTabTextMenu() {
    return DefaultTabController(
      length: 2,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: SC.right(200), left: SC.left(200)),
        //color: Colors.yellowAccent,
        child: TabBar(
          isScrollable: false,
          onTap: (index) {
            changePage(index);
          },
    //      controller: _tabController,
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

