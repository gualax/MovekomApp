import 'package:flutter/material.dart';
import 'package:movekomapp/HomeButtomNavBar.dart';
import 'package:movekomapp/HomePage.dart';

import 'FloatingMenu.dart';
import 'PrincipalHome.dart';


class Menu1 extends StatefulWidget {
  @override
  _Menu1State createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {

  bool tapped = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu 1"),
      ),
      /*
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

       */
    body: Text("MENU 1"), // new
    );
  }

  void onTabTapped(int index) {
      print("index is : " + index.toString());
      if(index == 0){
        Navigator.pop(context,0);
      }else{
        Navigator.pop(context,1);
      }

  }



}
