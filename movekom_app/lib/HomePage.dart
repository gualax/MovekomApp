import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/pantallas/Configuration/ConfigMenuPage.dart';
import 'package:movekomapp/pantallas/ManualesPage/ManualesMenuPage.dart';
import 'package:movekomapp/pantallas/ModesPage/ModesMenuPage.dart';
import 'package:movekomapp/pantallas/Tools/ToolsMenuPage.dart';
import 'package:movekomapp/pantallas/Warnings/WarningMenuPage.dart';
import 'package:movekomapp/pantallas/ilumination/LigthsMenuPage.dart';
import 'package:movekomapp/pantallas/Water/WaterMenuPage.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterMenuPage.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityMenuPage.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'Utils/SC.dart';
import 'Utils/SizeConf.dart';
import 'pantallas/PrincipalHome.dart';


class HomePage extends StatefulWidget {
   HomePage({Key key, this.indexToShow}) : super(key: key);
   final int indexToShow;

   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String barTitle = "HOME";
  String barSubTitle = " PANTALLA GENERAL";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SizeConf().init(context);
    SC().init(context);
    return
     Scaffold(
       resizeToAvoidBottomPadding: false,
        appBar:   PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.v * 7.5), // here the desired height
          child: CustomBar(),
   ),
        bottomNavigationBar: new BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black87,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/home.svg", true),
                activeIcon: activeIcon("assets/icons/home.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/fire.svg", true),
                activeIcon: activeIcon("assets/icons/fire.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/electricidad.svg", true),
                activeIcon: activeIcon("assets/icons/electricidad.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/gota_agua.svg",true),
                activeIcon: activeIcon("assets/icons/gota_agua.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/luz.svg", true),
                activeIcon: activeIcon("assets/icons/luz.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/capa_2.svg", false),
                activeIcon: activeIcon("assets/icons/capa_2.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/cuadro_alerta.svg", false),
                activeIcon: activeIcon("assets/icons/cuadro_alerta.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/caja_herramientas.svg", false),
                activeIcon: activeIcon("assets/icons/caja_herramientas.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/alerta_triangulo.svg", false),
                activeIcon: activeIcon("assets/icons/alerta_triangulo.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/config2.svg", false),
                activeIcon: activeIcon("assets/icons/config2.svg"),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/360.svg", false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/matafuego.svg", false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/play.svg",false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/volante.svg",false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/candado.svg", false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/slide_out.svg",false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/icons/suspension.svg",false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/images/tyre.svg", false),
                title: new Text(""),
              ),
              new BottomNavigationBarItem(
                icon: iconSvg("assets/images/capa_2.svg",false),
                title: new Text(""),
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
      ModesMenuPage(),
      ManualesMenuPage(),
      ToolsMenuPage(),
      WarningMenuPage(),
      ConfigMenuPage(),
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

  Widget iconSvg(assetName,isEnabled){
    Color color;
    if(isEnabled == true) {
      color = Colors.white;
    }else{
      color = Colors.grey;
    }
     return  SvgPicture.asset(
        assetName,
        height: SizeConfig.v * 5.7,
        width: SizeConfig.h * 5.5,
        color: color,
    );
  }


  Widget iconSvgActive(assetName,color){
    return  SvgPicture.asset(
      assetName,
      height: SizeConfig.v * 5.7,
      width: SizeConfig.h * 5.5,
      color: color,
    );
  }

  Widget activeIcon(iconRoute){
    return Container(
       // width: 63,
       // height: 84,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
                color:Colors.lightGreenAccent,
                offset: Offset(0,0),
                blurRadius: 35,
              //  spreadRadius: 10
            )] ,
        ),
        child: iconSvgActive(iconRoute, Colors.lightGreenAccent),
    );
  }

void changeBarTitle(index){
  List<String> titles = [
    "HOME",
    "CLIMA",
    "ELECTRICIDAD",
    "AGUA",
    "ILUMINACION",
    "MODOS",
    "MANUALES",
    "ACCESORIOS",
    "AVISOS",
    "AJUSTES",

  ];
  List<String> subtitles = [
    " PANTALLA GENERAL",
    " PANTALLA GENERAL",
    " ESTADO DE BATERIAS",
    " NIVELES DEPOSITOS Y VALVULAS",
    " ILUMINACION",
    " MODOS INTELIGENTES DE FUNCIONAMIENTO",
    " MANUALES Y LIBROS DE INSTRUCCIONES",
    " EQUIPOS ACCESORIOS DEL VEHICULO",
    " REGISTRO DE AVERIAS Y FALLOS",
    " AJUSTES DEL SISTEMA"
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
    bottom: PreferredSize(child:
    Container(
      color: Colors.lightGreen,
      height: SizeConfig.v * 0.5),
        preferredSize: Size.fromHeight(SizeConfig.v * 0.5)),
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BarTitle(barTitle,barSubTitle),
          Image.asset(
            'assets/images/drawable-mdpi/fondo_negro_e_verde.png',
            fit: BoxFit.contain,
            height: SizeConfig.v * 7,
          ),
        ],
      ),
    ),
  );
}

 Widget BarTitle(title, subtitle){
     return
       Container(
         margin: EdgeInsets.only(left: SizeConfig.h * 2,top:SizeConfig.v * 3),
         alignment: Alignment.topLeft,
         height: SizeConfig.v * 8,
         child: RichText(
             text: new TextSpan(
                 children: [
                   new TextSpan(
                       text: title,
                       style: MyTextStyle.estiloBold(SizeConfig.v * 5.5, Colors.white),
                   ),
                   new TextSpan(
                       text:subtitle,
                       style: MyTextStyle.estiloBold(SizeConfig.v * 3, Colors.grey),
                   ),
                 ]
             )
         ),
       );
   }
}
