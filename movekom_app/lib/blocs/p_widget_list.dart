/// The [dart:async] is neccessary for using streams
import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/controladores/alarmas/alarma.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/controladores/electricidad/Inversor.dart';
import 'package:movekomapp/controladores/iluminacion/LigthsBedRoom.dart';
import 'package:movekomapp/controladores/iluminacion/LucesBano.dart';
import 'package:movekomapp/controladores/iluminacion/LucesCocina.dart';
import 'package:movekomapp/controladores/iluminacion/LucesExterior.dart';
import 'package:movekomapp/controladores/iluminacion/LucesSalon.dart';
import 'package:movekomapp/controladores/iluminacion/LuzGeneral.dart';
import 'package:movekomapp/controladores/iluminacion/ModoLuz1.dart';
import 'package:movekomapp/controladores/iluminacion/ModoLuz2.dart';
import 'package:movekomapp/controladores/iluminacion/Upligth.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasAuto.dart';
import 'package:movekomapp/controladores/modos/ModoDescanso.dart';
import 'package:movekomapp/controladores/modos/ModoLargaDist.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaCalef.dart';
import 'package:movekomapp/controladores/modos/ModoLimpiezaTuberias.dart';
import 'package:movekomapp/controladores/modos/ModoPanelSolar.dart';
import 'package:movekomapp/controladores/nevera/nevera.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/ww/luz_exterior_widget.dart';
import 'package:movekomapp/ww/luz_general_widget.dart';
import 'package:movekomapp/ww/temperature_widget.dart';
import 'package:movekomapp/ww/upligth_widget.dart';

import '../WidgetsMenu.dart';

class WidgetListIemsBloc {

  static final double  MID_ADD_BAR  = 120.0;
  static final double SMALL_ADD_BAR  = 80.0;
  static final double BIG_ADD_BAR  = 240.0;
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  ///
  final carrouselStreamController = StreamController.broadcast();
  final wwListStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getCarrouselStream => carrouselStreamController.stream;
  Stream get getWwListStream => wwListStreamController.stream;


  List<Widget> wwList = [
    widgetBoiler(2),
    Calefaccion(3),
    Inversor(3),
    CargadorBaterias(3),

    WeatherBox(0,2),
    Nevera(3),
    BombaAgua(3),
    TemperatureWW(),
    LuzExtWW(),
    LuzGenWW(),
    LuzUpligthWW(),

    LucesExterior(3),
    LucesCocina(2),
    LigthsBedroom(2),
    LucesBano(2),

    LucesSalon(2),
    Upligth(3),
    LuzGeneral(3),
    ModoLuz1(3),

    ModoLuz2(3),
    ModoPanelSolar(2),
    ModoLimpiezaTuberias(2),
    ModoLimpiezaCalefaccion(2),
    ModoLargaDist(2),
    ModoDescanso(2),
    ModoAntiHeladasAuto(2),

    Alarma(3),
  ];

  final List<Widget> carrouselList = [
   // widgetBoiler(1),
    //Calefaccion(1),
    //Inversor(1),
    //box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
    AddWidget(),
  ];

  void addToCarrousel(item) {
    print("addToCarrousel");
    carrouselList.add(item);
    wwListStreamController.sink.add(wwList);
  }

  void removeFromCarrousel(item) {
    print("removeFromCart");
    carrouselList.remove(item);
    carrouselStreamController.sink.add(carrouselList);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    carrouselStreamController.close(); // close our StreamController
    wwListStreamController.close();
  }

}

class AddWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return add_device(context) ;
  }

  Widget add_device(context){
    return AbsorbPointer(
        absorbing: false,
        child: GestureDetector(
      onTap: () {
        print("TAP");
        showDialog (
          context: context,
          builder: (BuildContext context) => WidgetsMenuDialog(),
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
                          style: MyTextStyle.estilo(16, Colors.white),),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
        ),
    );
  }

}

final bloc = WidgetListIemsBloc();



