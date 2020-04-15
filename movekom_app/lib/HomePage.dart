import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
   appBar:   PreferredSize(
     preferredSize: Size.fromHeight(45.0), // here the desired height
     child: AppBar(
        backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/drawable-mdpi/fondo_negro_e_verde.png',
                fit: BoxFit.contain,
                height: 45,
              ),
            ],
          ),
        ),
   ),
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Colors.white ),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/idea.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/move_1.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/manual.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/toolbox_1.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/caution_sign.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/cog.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/360_degrees.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/gas.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/page_1.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/xmlid_1689.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/lock.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/suspension.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/tyre.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/reset.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu,color: Colors.white),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu,color: Colors.white),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu,color: Colors.white),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu,color: Colors.white),
              title: new Text("Menu"),
            ),
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

  Widget  iconSvg(assetName,color){
     return  SvgPicture.asset(
        assetName,
        color: color,
    );
  }



}
