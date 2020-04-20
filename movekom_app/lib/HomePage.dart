import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/pantallas/LigthsMenuPage.dart';
import 'package:movekomapp/pantallas/WaterMenuPage.dart';
import 'package:movekomapp/pantallas/WheaterMenuPage.dart';
import 'package:movekomapp/pantallas/ElectricityMenuPage.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'FloatingMenu.dart';
import 'pantallas/PrincipalHome.dart';


class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);
   HomePage({Key key, this.indexToShow}) : super(key: key);
   final int indexToShow;

   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String barTitle = "HOME";
  String barSubTitle = "HOME";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:   PreferredSize(
     preferredSize: Size.fromHeight(70), // here the desired height
     child: CustomBar(),
   ),
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/home.svg", Colors.grey),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/iconos/clima.svg", Colors.grey),
              title: new Text("clima"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/iconos/electricidad.svg", Colors.grey),
              title: new Text("Menu"),
            ),
            new BottomNavigationBarItem(
              icon: iconSvg("assets/images/water_gout.svg", Colors.grey),
              title: new Text("Menu"),
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
              icon: iconSvg("assets/icons/slide_out.svg", Colors.grey),
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
              icon: iconSvg("assets/images/capa_2.svg", Colors.grey),
              title: new Text("Menu"),
            ),
          ]),
      body: show(_currentIndex, context), // new
    );
  }


  Widget show(int index, context){
    List<Widget> _children = [
      PrincipalHome(),
      ClimaPage(),
      ElectricityPage(),
      WaterMenuPage(),
      LightsMenuPage(),
    ];
    return _children[index];
  }

  void onTabTapped(int index) {
    print("HomePage -> onTabTapped");
    setState(() {
      _currentIndex = index;
      changeBarTitle(_currentIndex);
      print("index is : " + index.toString());
    });
  }

  Widget  iconSvg(assetName,color){
     return  SvgPicture.asset(
        assetName,
        height: 40,
        width: 40,
        color: color,
    );
  }

void changeBarTitle(index){
  List<String> titles = [
    "HOME",
    "CLIMA",
    "ELECTRICIDAD",
  ];
  List<String> subtitles = [
    "HOME",
    "CLIMA",
    "ELECTRICIDAD",
  ];
  setBarTitle(titles[index], subtitles[index]);
}


  void setBarTitle(title,subtitle){
    setState(() {
      barTitle = title;
      barSubTitle = subtitle;
    });
}


Widget CustomBar(){
  return AppBar(
    backgroundColor: Colors.black,
    bottom: PreferredSize(child: Container(color: Colors.lightGreen, height: 4.0,), preferredSize: Size.fromHeight(4.0)),
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BarTitle(barTitle,barSubTitle),
          Image.asset(
            'assets/images/drawable-mdpi/fondo_negro_e_verde.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ],
      ),
    ),
  );
}

 Widget BarTitle(title, subtitle){
     return
       Container(
         margin: EdgeInsets.only(left: 30,top:30),
         alignment: Alignment.topLeft,
         height: 70,
         child: RichText(
             text: new TextSpan(
                 children: [
                   new TextSpan(
                       text: title,
                       style: MyTextStyle.estiloBold(40, Colors.white),
                   ),
                   new TextSpan(
                       text:subtitle,
                       style: MyTextStyle.estilo(20, Colors.grey),
                   ),
                 ]
             )
         ),
       );
   }
}
