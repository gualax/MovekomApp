import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/bluetooth/test_bt.dart';
import 'package:movekomapp/pantallas/Alarm/AlarmMenuPage.dart';
import 'package:movekomapp/pantallas/Configuration/ConfigMenuPage.dart';
import 'package:movekomapp/pantallas/ManualesPage/ManualesMenuPage.dart';
import 'package:movekomapp/pantallas/ModesPage/ModesMenuPage.dart';
import 'package:movekomapp/pantallas/Reles/ElectricityReleView.dart';
import 'package:movekomapp/pantallas/Tools/ToolsMenuPage.dart';
import 'package:movekomapp/pantallas/Warnings/WarningMenuPage.dart';
import 'package:movekomapp/pantallas/ilumination/LigthsMenuPage.dart';
import 'package:movekomapp/pantallas/Water/WaterMenuPage.dart';
import 'package:movekomapp/pantallas/Wheater/WheaterMenuPage.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityMenuPage.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'Utils/SC.dart';
import 'Utils/SizeConf.dart';
import 'Utils/dart_anim.dart';
import 'blocs/tab_bloc.dart';
import 'pantallas/PrincipalHome.dart';


class HomePage extends StatefulWidget {
   HomePage({Key key,this.indexPage}) : super(key: key);
   int indexPage;

   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  TabBloc tabBloc;
  int _currentIndex;
  String barTitle = "HOME";
  String barSubTitle = " PANTALLA GENERAL";

  List<Widget> pageList= [
    PrincipalHome(),
    ClimaPage(),
    ElectricityPage(),
    ElectricityReleView(),
    WaterMenuPage(),
    AlarmMenuPage(),
    LightsMenuPage(),
    ModesMenuPage(),
    ManualesMenuPage(),
    ToolsMenuPage(),
    WarningMenuPage(),
    ConfigMenuPage(),
    TestBtPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex  = widget.indexPage;
    setBarTitle(titles[_currentIndex], subtitles[_currentIndex]);
  }


  @override
  Widget build(BuildContext context) {
   tabBloc = BlocProvider.of<TabBloc>(context);

    SizeConfig().init(context);
    SizeConf().init(context);
    SC().init(context);
    return
      BlocBuilder<TabBloc,TabState>(
          builder: ( context, state) {
            _currentIndex = state.index;
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(SC.hei(55)),
                  // here the desired height
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
                        icon: iconSvg("assets/icons/rele_bar_icon.svg", true),
                        activeIcon: activeIcon(
                            "assets/icons/rele_bar_icon.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg("assets/icons/gota_agua.svg", true),
                        activeIcon: activeIcon("assets/icons/gota_agua.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg("assets/icons/candado.svg", true),
                        activeIcon: activeIcon("assets/icons/candado.svg"),
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
                        activeIcon: activeIcon(
                            "assets/icons/cuadro_alerta.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg(
                            "assets/icons/caja_herramientas.svg", false),
                        activeIcon: activeIcon(
                            "assets/icons/caja_herramientas.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg(
                            "assets/icons/alerta_triangulo.svg", false),
                        activeIcon: activeIcon(
                            "assets/icons/alerta_triangulo.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg("assets/icons/config2.svg", false),
                        activeIcon: activeIcon("assets/icons/config2.svg"),
                        title: new Text(""),
                      ),
                      new BottomNavigationBarItem(
                        icon: iconSvg("assets/icons/bluetooth_icon.svg", false),
                        activeIcon: activeIcon("assets/icons/bluetooth_icon.svg"),
                        title: new Text(""),
                      ),
                    ]),
                body: showWithTransition(_currentIndex, context) // new
            );
          }
      );
  }


  Widget show(int index, context){
    return pageList[index];
  }

  Widget showWithTransition(int index, context){
    print("showWithTransition///");
    return MyStatefulWidget(widgetToAnim: pageList[index]);
  }

  void onTabTapped(int index) {
    print("HomePage -> onTabTapped");
    setState(() {
      tabBloc.add(UpdateTab(index));
      _currentIndex = index;
      setBarTitle(titles[_currentIndex], subtitles[_currentIndex]);
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
       height: SC.hei(42),
       width: SC.wid(42),
        color: color,
    );
  }


  Widget iconSvgActive(assetName,color){
    return  SvgPicture.asset(
      assetName,
      height: SC.hei(42),
      width: SC.wid(42),
      color: color,
    );
  }

  Widget activeIcon(iconRoute){
    return Container(
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



  List<String> titles = [
    "HOME",
    "CLIMA",
    "ELECTRICIDAD",
    "ELECTRICIDAD",
    "AGUA",
    "ALARMA",
    "ILUMINACION",
    "MODOS",
    "MANUALES",
    "ACCESORIOS",
    "AVISOS",
    "AJUSTES",
    "TEST",
  ];

  List<String> subtitles = [
    "    PANTALLA GENERAL",
    "    EQUIPOS DE CLIMATIAZACION",
    "    ESTADO DE BATERIAS",
    "    AJUSTES Y CUADRO ELECTRICO",
    "    NIVELES DEPOSITOS Y VALVULAS",
    "    SISTEMA BASICO DE ALARMA",
    "    ILUMINACION",
    "    MODOS INTELIGENTES DE FUNCIONAMIENTO",
    "    MANUALES Y LIBROS DE INSTRUCCIONES",
    "    EQUIPOS ACCESORIOS DEL VEHICULO",
    "    REGISTRO DE AVERIAS Y FALLOS",
    "    AJUSTES DEL SISTEMA"
    "    TEST",
  ];


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
      height: SC.hei(3)),
        preferredSize: Size.fromHeight(SC.hei(20))),
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BarTitle(barTitle,barSubTitle),
          Image.asset(
            'assets/images/drawable-mdpi/fondo_negro_e_verde.png',
            fit: BoxFit.contain,
            height:SC.hei(50),
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
         height: SC.hei(65),
         child: RichText(
             text: new TextSpan(
                 children: [
                   new TextSpan(
                       text: title,
                       style: MyTextStyle.estiloBold(45, Colors.white),
                   ),
                   new TextSpan(
                       text:subtitle,
                       style: MyTextStyle.estiloBold(25, Colors.grey),
                   ),
                 ]
             )
         ),
       );
   }


}
