
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConf.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasNegras.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_ext.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_int.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/electricidad/Totalizador.dart';
import 'package:movekomapp/controladores/iluminacion/Downligth.dart';
import 'package:movekomapp/controladores/iluminacion/LucesExterior.dart';
import 'package:movekomapp/controladores/iluminacion/LuzGeneral.dart';
import 'package:movekomapp/controladores/iluminacion/Upligth.dart';
import 'package:movekomapp/controladores/nevera/nevera.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/box137x137.dart';
import 'package:movekomapp/widgets/box137x64.dart';
import 'package:movekomapp/widgets/box225x137.dart';
import 'package:movekomapp/widgets/box_fecha.dart';

import '../WidgetsMenu.dart';


class PrincipalHome extends StatefulWidget {
  @override
  _PrincipalHomeState createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {

  List<Widget> carouselList = new List();
  List<String> lista = new List();
  CarouselSlider instance;
  BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    print("build");
    mContext = context;
    return
      Scaffold(
          resizeToAvoidBottomPadding: false,
         // backgroundColor: Colors.black,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            contenido(),
            horizontalList(),
          ],
        )
      );
  }

Widget horizontalList(){
    return Container(
      alignment: Alignment.center,
      height: SC.hei(150),
      margin: EdgeInsets.only(left: SC.left(40),top: SC.top(20)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          widgetBoiler(),
          Calefaccion(1),
          Inversor(1),
          //box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
          add_device(),
        ],
      ),
    );
}


  Widget contenido(){
    return MyContainer(
   //   margin: EdgeInsets.only(top: SC.top(20)),
      child: Row( /// elementos uno al lado del otro
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leftSection(),
          midleLeftSection(),
          midleRigthSection(),
          rightSection(),
        ],
      ),
    );
  }

  Widget midleLeftSection(){
  return
  MyContainer (
    child:
    Column(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TemperatureInt(1),
        TemperatureExt(1),
        FechaWidget(),
      ],
    ),
  );
  }

  Widget midleRigthSection(){
    return
      MyContainer (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BombaAgua(1),
            Nevera(1),
          ],
        ),
        );
  }

  Widget rightSection(){
      return
        MyContainer (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AguasLimpias(1),
              AguasSucias(1),
            ],
          ),
        );
    }



  Widget leftSection(){
    return
    MyContainer (
      child:
    Row(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        columaBateriaMotorYTotalizador(),
        column2(),
      ],
    ),
    );
  }

  Widget columaBateriaMotorYTotalizador(){
    return
      MyContainer(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BateriaMotor(1),
            Totalizador(),
          ],
        ),
      );
  }

  Widget column2(){
    return
      MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BateriaMotorAux1(1),
            principalLeftRow2(),
          ],
        ),
      );
  }

  Widget bateriaAuxiliar(){
    return
      MyContainer(
        margin: EdgeInsets.only(bottom: SC.bot(15)),
         width: 288, height:200, //200 //288
         decoration: new BoxDecoration(
            color: MyColors.baseColor,
        ),
    );
  }





  Widget principalLeftRow2(){
    return
      MyContainer(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            box137x64_carga("MOTOR","25.5Ah",true),
            box137x64_carga("SOLAR","12.5Ah",true),
            box137x64_carga("220","12.5Ah",true),
          ],
        ),
      );
  }

  Widget verticalHalfBoxesIlumination(){
    return MyContainer(
      child: Row (
        children: <Widget>[
          LucesExterior(1),
          LuzGeneral(1),
        ],
      ),
    );
  }

  Widget verticalHalfBoxesLed(){
    return MyContainer(
      child: Row (
        children: <Widget>[
          Upligth(1),
          Downligth(1),
        ],
      ),
    );
  }

  Widget add_device(){
    return  GestureDetector(
      onTap: () {
        print("TAP");
        showDialog(
          context: context,
          builder: (BuildContext context) => WidgetsMenu(),
        );
      },
      child: MyContainer(
        width: 225,
        height: 140,
        margin: EdgeInsets.all(SC.all(10)),
        child: DottedBorder(
          dashPattern: [8, 4],
          strokeWidth: 2,
          color: Colors.white,
          child: MyContainer(
            width: 225,
            height: 140,
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.add,size: 60,color: Colors.white,)
                    )
                ),
                MyPositioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("AÑADIR DISPOSITIVO",
                          style: MyTextStyle.estilo(16, Colors.white),)
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}

