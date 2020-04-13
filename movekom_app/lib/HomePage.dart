import 'package:flutter/material.dart';

import 'FloatingMenu.dart';
import 'PrincipalHome.dart';


class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);
   HomePage({Key key, this.indexToShow}) : super(key: key);
   final int indexToShow;

   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movekom application"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          backgroundColor: Colors.black87,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Colors.white ),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu,color: Colors.white),
              title: new Text("Menu"),
            )
          ]),
      body: show(_currentIndex, context), // new
    );
  }


  Widget show(int index, context){
    List<Widget> _children = [
      PrincipalHome(),
      FloatingMenu(),
    ];
    return _children[index];
  }

  void onTabTapped(int index) {
    print("HomePage -> onTabTapped");
    setState(() {
      _currentIndex = index;
      print("index is : " + index.toString());
    });
  }




}
