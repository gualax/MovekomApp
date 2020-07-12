
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movekomapp/Utils/MyColors.dart';
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
import 'package:movekomapp/pantallas/test_page.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/date.dart';
import 'Utils/SC.dart';
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
  double iconSize = 42;
  double topBarSize = 60;

  int _lastIndex;

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
    TestPage(),
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
    SC().init(context);
    return
      BlocBuilder<TabBloc,TabState>(
          builder: ( context, state) {
            _currentIndex = state.index;
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(SC.hei(topBarSize)),
                  child: CustomBar(),
                ),
                bottomSheet: Container(
                    color: MyColors.baseColor,
                    height: SC.hei(3)),
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
                        icon: iconSvg("assets/icons/360.svg", false),
                        activeIcon: activeIcon("assets/icons/360.svg"),
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
      return TransitionAnimation(widgetToAnim: pageList[index]);
  }

  void onTabTapped(int index) {
    print("HomePage -> onTabTapped");
    print("index :" + index.toString());
    print("_currentIndex :" + _currentIndex.toString());
    _lastIndex = _currentIndex;
    if(index != _currentIndex) {
      setState(() {
        tabBloc.add(UpdateTab(index));
        _currentIndex = index;
        setBarTitle(titles[_currentIndex], subtitles[_currentIndex]);
        print("index is : " + index.toString());
      });
    }
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
       height: SC.hei(iconSize),
       width: SC.wid(iconSize),
        color: color,
    );
  }


  Widget iconSvgActive(assetName,color){
    return  SvgPicture.asset(
      assetName,
      height: SC.hei(iconSize),
      width: SC.wid(iconSize),
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



  /// ver para emular el gradient cuadrado
  Widget activeConSombra(iconRoute){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color:Colors.lightGreenAccent,
          offset: Offset(0,0),
          blurRadius: 35,
          //  spreadRadius: 10
        )] ,
      ),
      child: iconSvgD("assets/icons/sombra_rect.svg", Colors.lightGreenAccent,iconSize),

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
    "    EQUIPOS DE CLIMATIZACION",
    "    ESTADO DE BATERIAS",
    "    FUSIBLES",
    "    NIVELES DEPOSITOS Y VALVULAS",
    "    SISTEMA BASICO DE ALARMA",
    "    ILUMINACION",
    "    MODOS INTELIGENTES DE FUNCIONAMIENTO",
    "    MANUALES Y LIBROS DE INSTRUCCIONES",
    "    EQUIPOS ACCESORIOS DEL VEHICULO",
    "    REGISTRO DE AVERIAS Y FALLOS",
    "    AJUSTES DEL SISTEMA",
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
    bottom: PreferredSize(
     child: Container(
      color: MyColors.principal,
      height: SC.hei(3)
     ),
        preferredSize: Size.fromHeight(SC.hei(20))),
    title: PreferredSize(
      child: Container(
        //color: Colors.blue,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.center,
                child: DateWidet(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:SC.top(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BarTitle(barTitle,barSubTitle),
                  InkWell(
                    splashColor: MyColors.principal,
                    onLongPress:(){
                      print("TAP MOVEKOM");
                      SystemNavigator.pop();
                    } ,
                    child: Image.asset(
                      'assets/images/drawable-mdpi/fondo_negro_e_verde.png',
                      fit: BoxFit.contain,
                      height:SC.hei(60),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
       // preferredSize: Size.fromHeight(SC.hei(200)),
  )
  );
}


/*
          Text(dateTime.hour.toString() + ":" + dateTime.minute.toString(),
          style: MyTextStyle.estiloBold(20, MyColors.text),),
 */

 Widget BarTitle(title, subtitle){
     return
       Container(
         margin: EdgeInsets.only(left:SC.left(5),top:SC.top(5)),
         alignment: Alignment.topLeft,
         height: SC.hei(60),
         child: RichText(
             text: new TextSpan(
                 children: [
                   new TextSpan(
                       text: title,
                       style: MyTextStyle.estiloBold(45, Colors.white),
                   ),
                   new TextSpan(
                       text:subtitle,
                       style: MyTextStyle.estiloBold(23, Colors.grey),
                   ),
                 ]
             )
         ),
       );
   }


}
