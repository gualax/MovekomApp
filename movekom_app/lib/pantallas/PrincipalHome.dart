
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/components/carousel/gf_items_carousel.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/blocs/bateria_motor_bloc.dart';
import 'package:movekomapp/blocs/stopwatch_bloc.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor2.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/box137x137.dart';
import 'package:movekomapp/widgets/box137x64.dart';
import 'package:movekomapp/widgets/box225x137.dart';


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
  final  bateriaMotorBloc = BlocProvider.of<BateriaMotorBloc>(context);
  //final  stopWatch = BlocProvider.of<StopwatchBloc>(context);
    print("build");
    mContext = context;
    return
      Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: <Widget>[
            contenido(),
            horizontalList(),
          ],
        )
      );
  }
//Widget box225x140_boiler(title, textAbajoIzq, textAbajoDer,
//    iconRoute, textValue, state){
Widget carouselDispositivos(){
  return  Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(20),
   color: Colors.blue,
   child:  GFItemsCarousel(
        itemHeight: 180,
        rowCount: 5,
        children: <Widget>[
          box225x140_1icon_text("BOILER",2.65 , "assets/icons/ducha.svg","70ºC",true),
          box225x140_1icon_text("CALEFACCION",2.65 , "assets/icons/fire.svg","20ºC",true),
          box225x140_1icon("INVERSOR DE CORRIENTE",2.65 , "assets/icons/bat_enchufe.svg",true),
          box225x140_1icon("VALVULAS",2.65 , "assets/iconos/valvula agua.svg",false),
          box225x140_add_device(),
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
          box225x140_1icon_text("BOILER",2.65 , "assets/icons/ducha.svg","70ºC",true),
          box225x140_1icon_text("CALEFACCION",2.65 , "assets/icons/fire.svg","20ºC",true),
          box225x140_1icon("INVERSOR DE CORRIENTE",2.65 , "assets/icons/bat_enchufe.svg",true),
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
                box137x137_Pronostico(mContext,"assets/icons/sol_nubes.svg"),
                box137x137_Fecha_Hora(mContext,"12 ABRIL","17:05"),
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
                  box137x137_Aguas(AppLocalizations.of(mContext).translate("aguas_limpias"),"95%",true),
                  box137x137_Aguas(AppLocalizations.of(mContext).translate("aguas_sucias"),"50%",true),
                ],
              ),
              Row(
                children: <Widget>[
                  box137x137_Bomba_Agua(mContext,"2.65A",true),
                  box137x137_Aguas(AppLocalizations.of(mContext).translate("aguas_negras"),"50%",true),
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
    Column(  /// Elementos uno arriba del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        principalLeftRow1(),
        principalLeftRow2(),
      ],
    ),
    );
  }


  Widget principalLeftRow1(){
    return
      Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            BateriaMotor2(),
       //     box137x137_Bateria(AppLocalizations.of(mContext).translate("bateria_aux_1"),50,"12.45v","23.65A", true),
            BateriaMotor2(),
            box137x137_Bateria(AppLocalizations.of(mContext).translate("bateria_aux_2"),25,"12.45v","23.65A", false),
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
            box_imagen("totalizador","cargando",20),
            columnCargas(),
            columnTiempoDeUso(),
          ],
        ),
      );
  }

  Widget verticalIluminationBox(firstIcon,secondIcon,bool state){
      Color color;
      String text;
      print(state);
      if(state == true){
        color = Colors.lightGreen;
        text = "ON";
      }else {
        color = Colors.grey;
        text = "OFF";
      }
     return Container(
            margin: EdgeInsets.all(5),
            width: 66,
            height: 137,
            decoration: new BoxDecoration(
                color: MyColors.ContainerColor,
            ),
         child: Stack(
           children: <Widget>[
             Positioned.fill(
               top: 5,
                 child: Align(
                   alignment: Alignment.topCenter,
                   child: iconSvgD(firstIcon, color, 35),
                 )
             ),Positioned.fill(
                 child: Align(
                   alignment: Alignment.center,
                   child: iconSvgD(secondIcon, color, 35),
                 )
             ),Positioned.fill(
               bottom: 8,
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child:   RichText(
                       text: TextSpan(
                           children: [
                             TextSpan(
                                 style: MyTextStyle.estiloBold(20,color),
                                 text: text ),
                           ]
                       )
                   ),
                 )
             )
           ],
           ),
     );
  }

  Widget verticalHalfBoxesIlumination(){
    return Container(
      child: Row (
        children: <Widget>[
          verticalIluminationBox("assets/icons/luz.svg","assets/icons/exterior.svg",false),
          verticalIluminationBox("assets/icons/luz.svg","assets/icons/todas_luces.svg",true),
        ],
      )
      ,
    );
  }

  Widget verticalHalfBoxesLed(){
    return Container(
      child: Row (
        children: <Widget>[
          verticalLedBox("assets/icons/tira_led.svg",false),
          verticalLedBox("assets/icons/tira_led.svg",true),
        ],
      )
      ,
    );
  }

  Widget verticalLedBox(firstIcon,bool state){
    Color color;
    String text;
    print(state);
    if(state == true){
      color = Colors.lightGreen;
      text = "ON";
    }else {
      color = Colors.grey;
      text = "OFF";
    }
    return Container(
      margin: EdgeInsets.all(5),
      width: 66,
      height: 137,
      decoration: new BoxDecoration(
        color: MyColors.ContainerColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child:  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(20,color),
                              text: "LED" ),
                        ]
                    )
                ),
              )
          ),Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD(firstIcon, color, 45),
              )
          ),Positioned.fill(
              bottom: 8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:   RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: MyTextStyle.estiloBold(20,color),
                              text: text ),
                        ]
                    )
                ),
              )
          )
        ],
      ),
    );
  }

Widget columnCargas(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //Widget box137x64_carga(title,iconRoute,valueAh,state){
        children: <Widget>[
          box137x64_carga("CARGA MOTOR","assets/iconos/motor.svg","25.5Ah",true),
          box137x64_Tiempo_uso("CARGA DE 220","___Ah",false),
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
          box137x64_carga("CARGA SOLAR","assets/iconos/panel solar 2.svg","12.5Ah",true),
          box137x64_Tiempo_uso("TIEMPO DE USO",">100Hr",true),
        ],
      ),
    );
  }

}

