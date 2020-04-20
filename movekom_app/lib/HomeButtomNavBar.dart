
import 'dart:async';

import 'package:flutter/material.dart';
import 'FloatingMenu.dart';
import 'pantallas/PrincipalHome.dart';

class HomeButtonNavBar extends StatefulWidget {
  @override
  _HomeButtonNavBarState createState() => _HomeButtonNavBarState();
}

class _HomeButtonNavBarState extends State<HomeButtonNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        backgroundColor: Colors.black87,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.white ),
            title: new Text("Home"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.menu,color: Colors.white),
            title: new Text("Menu"),
          )
        ]);
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print("index is : " + index.toString());
    });
  }

   Widget show(int index, context){
    List<Widget> _children = [
      PrincipalHome(),
      FloatingMenu(),
    ];
    return _children[index];
  }


}
