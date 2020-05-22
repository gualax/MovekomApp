
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/carousel/gf_items_carousel.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/controladores/agua/AguasLimpias.dart';
import 'package:movekomapp/controladores/agua/AguasNegras.dart';
import 'package:movekomapp/controladores/agua/AguasSucias.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux1.dart';
import 'package:movekomapp/controladores/electricidad/BateriaAux2.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/iluminacion/Downligth.dart';
import 'package:movekomapp/controladores/iluminacion/LucesExterior.dart';
import 'package:movekomapp/controladores/iluminacion/LuzGeneral.dart';
import 'package:movekomapp/controladores/iluminacion/Upligth.dart';
import 'package:movekomapp/pantallas/Wheater/current_location.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/box137x137.dart';
import 'package:movekomapp/widgets/box137x64.dart';
import 'package:movekomapp/widgets/box225x137.dart';
import 'package:movekomapp/widgets/box_fecha.dart';


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
      height: 180,
      margin: EdgeInsets.only(left: 40,top: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          widgetBoiler(),
          Calefaccion(1),
          Inversor(1),
          box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
          box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
          box225x140_add_device(),
        ],
      ),
    );
}


  Widget contenido(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row( /// elementos uno al lado del otro
        mainAxisAlignment: MainAxisAlignment.center,
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
  Container (
    margin: EdgeInsets.all(5),
    child:
    Column(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        box137x137_Temperatura(mContext,"TEMP. INTERIOR","30%","21.5C"),
        box137x137_Temperatura(mContext,"TEMP. EXTERIOR","30%","26.5C"),
      ],
    ),
  );
  }

  Widget midleRigthSection(){
    return
      Container (
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                FechaWidget(),
                FechaWidget(),
              ],
            ),
            Row(
              children: <Widget>[
                  verticalHalfBoxesIlumination(),
                  verticalHalfBoxesLed(),
              ],
            ),
          ],
        ),
        );
  }

  Widget rightSection(){
      return
        Container (
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[
                  AguasLimpias(1),
                  AguasSucias(1),
                ],
              ),
              Row(
                children: <Widget>[
                  BombaAgua(1),
                  AguasNegras(1),
                ],
              ),
            ],
          ),
        );
    }



  Widget leftSection(){
    return
    Container (
      margin: EdgeInsets.all(5),
      child:
    Row(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        column1(),
        column2(),
      ],
    ),
    );
  }

  Widget column1(){
    return
      Container(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BateriaMotor(1),
            box_imagen("totalizador","cargando",20),
          ],
        ),
      );
  }

  Widget column2(){
    return
      Container(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bateriaAuxiliar(),
            principalLeftRow2(),
          ],
        ),
      );
  }

  Widget bateriaAuxiliar(){
    return
      Container(
        margin: EdgeInsets.only(bottom: 14),
         width: 288, height: 205,
         decoration: new BoxDecoration(
            color: MyColors.ContainerColor,
        ),
    );
  }



  Widget principalLeftRow1(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BateriaMotor(1),
            BateriaMotorAux1(1),
            BateriaMotorAux2(1),
          ],
        ),
      );
  }


  Widget principalLeftRow2(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            columnCargas(),
            columnTiempoDeUso(),
          ],
        ),
      );
  }

  Widget verticalHalfBoxesIlumination(){
    return Container(
      child: Row (
        children: <Widget>[
          LucesExterior(1),
          LuzGeneral(1),
        ],
      ),
    );
  }

  Widget verticalHalfBoxesLed(){
    return Container(
      child: Row (
        children: <Widget>[
          Upligth(1),
          Downligth(1),
        ],
      )
      ,
    );
  }


Widget columnCargas(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //Widget box137x64_carga(title,iconRoute,valueAh,state){
        children: <Widget>[
          box137x64_carga("CARGA MOTOR","assets/icons/engine_motor.svg","25.5Ah",true),
    //      box137x64_Tiempo_uso("CARGA DE 220","___Ah",false),
        ],
      ),
    );
}


  Widget columnTiempoDeUso(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //Widget box137x64_carga(title,iconRoute,valueAh,state){
        children: <Widget>[
          box137x64_carga("CARGA SOLAR","assets/icons/solar_panel_1.svg","12.5Ah",true),
         // box137x64_Tiempo_uso("TIEMPO DE USO",">100Hr",true),
        ],
      ),
    );
  }

}

