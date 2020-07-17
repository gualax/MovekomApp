/// The [dart:async] is neccessary for using streams
import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/WWidgets/modo_limpieza_calef.dart';
import 'package:movekomapp/WWidgets/ww_alarma.dart';
import 'package:movekomapp/WWidgets/ww_boiler.dart';
import 'package:movekomapp/WWidgets/ww_bomba_agua.dart';
import 'package:movekomapp/WWidgets/ww_calefaccion.dart';
import 'package:movekomapp/WWidgets/ww_cargador_baterias.dart';
import 'package:movekomapp/WWidgets/ww_inversor.dart';
import 'package:movekomapp/WWidgets/ww_luces_bano.dart';
import 'package:movekomapp/WWidgets/ww_luces_bedroom.dart';
import 'package:movekomapp/WWidgets/ww_luces_cocina.dart';
import 'package:movekomapp/WWidgets/ww_luces_ext.dart';
import 'package:movekomapp/WWidgets/ww_luces_salon.dart';
import 'package:movekomapp/WWidgets/ww_luces_uplight.dart';
import 'package:movekomapp/WWidgets/ww_luz_general.dart';
import 'package:movekomapp/WWidgets/ww_modo_anti_heladas_auto.dart';
import 'package:movekomapp/WWidgets/ww_modo_descanso.dart';
import 'package:movekomapp/WWidgets/ww_modo_larga_dist.dart';
import 'package:movekomapp/WWidgets/ww_modo_limpieza_tub.dart';
import 'package:movekomapp/WWidgets/ww_modo_luz1.dart';
import 'package:movekomapp/WWidgets/ww_modo_luz2.dart';
import 'package:movekomapp/WWidgets/ww_modo_panel_solar.dart';
import 'package:movekomapp/WWidgets/ww_nevera.dart';
import 'package:movekomapp/WWidgets/ww_temperature.dart';
import 'package:movekomapp/WWidgets/ww_upligth.dart';
import 'package:movekomapp/WWidgets/ww_wheater_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/WWidgets.dart';
import 'package:movekomapp/WWidgets/ww_luz_exterior.dart';


import '../WidgetsMenu.dart';

class WidgetListIemsBloc {

  static final double  MID_ADD_BAR  = 105.5;
  static final double SMALL_ADD_BAR  = 66.0;
  static final double BIG_ADD_BAR  = 225.0;
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  ///
  final carrouselStreamController = StreamController.broadcast();
  final wwListStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getCarrouselStream => carrouselStreamController.stream;
  Stream get getWwListStream => wwListStreamController.stream;


  List<WWidget> wwList = [

   // WWidget(widget: widgetBoiler(2),width: BIG_ADD_BAR),
    WWidget(wActive: WWBoiler(true), width: BIG_ADD_BAR, wInactive:WWBoiler(false)),
    WWidget(wActive: WWCalefaccion(true), width: BIG_ADD_BAR, wInactive:WWCalefaccion(false)),
    WWidget(wActive: WWInversor(true), width: BIG_ADD_BAR, wInactive:WWInversor(false)),
    WWidget(wActive: WWCargadorBaterias(true), width: BIG_ADD_BAR, wInactive:WWCargadorBaterias(false)),
    WWidget(wActive: WwWeatherBox(true), width: BIG_ADD_BAR, wInactive:WwWeatherBox(false)),

    WWidget(wActive: WWNevera(true), width: MID_ADD_BAR, wInactive:WWNevera(false)),
    WWidget(wActive: WWBombaAgua(true), width: MID_ADD_BAR, wInactive:WWBombaAgua(false)),
    WWidget(wActive: WWTemperature(true), width: BIG_ADD_BAR, wInactive:WWTemperature(false)),
    WWidget(wActive: WWLuzExt(true), width: SMALL_ADD_BAR, wInactive:WWLuzExt(false)),
    WWidget(wActive: WWLuzGen(true), width: SMALL_ADD_BAR, wInactive:WWLuzGen(false)),
    WWidget(wActive: WWLuzUpligth(true), width: SMALL_ADD_BAR, wInactive:WWLuzUpligth(false)),

    WWidget(wActive: WWLucesExt(true), width: BIG_ADD_BAR, wInactive:WWLucesExt(false)),
    WWidget(wActive: WWLucesCocina(true), width: BIG_ADD_BAR, wInactive:WWLucesCocina(false)),
    WWidget(wActive: WWLucesBedroom(true), width: BIG_ADD_BAR, wInactive:WWLucesBedroom(false)),

    WWidget(wActive: WWLucesBano(true), width: BIG_ADD_BAR, wInactive:WWLucesBano(false)),
    WWidget(wActive: WWLucesSalon(true), width: BIG_ADD_BAR, wInactive:WWLucesSalon(false)),

    WWidget(wActive: WWLucesUplight(true), width: BIG_ADD_BAR, wInactive:WWLucesUplight(false)),

    WWidget(wActive: WWModoLuz1(true), width: BIG_ADD_BAR, wInactive:WWModoLuz1(false)),
    WWidget(wActive: WWModoLuz2(true), width: BIG_ADD_BAR, wInactive:WWModoLuz1(false)),

    WWidget(wActive: WWModoPanelSolar(true), width: MID_ADD_BAR, wInactive:WWModoPanelSolar(false)),
    WWidget(wActive: WWModoLimpiezaTuberias(true), width: MID_ADD_BAR, wInactive:WWModoLimpiezaTuberias(false)),
    WWidget(wActive: WWModoLimpiezaCalef(true), width: MID_ADD_BAR, wInactive:WWModoLimpiezaCalef(false)),
    WWidget(wActive: WWModoLargaDist(true), width: MID_ADD_BAR, wInactive:WWModoLargaDist(false)),

    WWidget(wActive: WWModoDescanso(true), width: MID_ADD_BAR, wInactive:WWModoDescanso(false)),
    WWidget(wActive: WWModoAntiHeladasAuto(true), width: MID_ADD_BAR, wInactive:WWModoAntiHeladasAuto(false)),
    WWidget(wActive: WWAlarma(true), width: MID_ADD_BAR, wInactive:WWAlarma(false)),


    /*
    WWidget(widget: Inversor(3),width: BIG_ADD_BAR),
    WWidget(widget: CargadorBaterias(3),width: BIG_ADD_BAR),
    WWidget(widget: WeatherBox(0,2),width: BIG_ADD_BAR),

    WWidget(widget: Nevera(3),width: MID_ADD_BAR),
    WWidget(widget: BombaAgua(3),width: MID_ADD_BAR),
    WWidget(widget: TemperatureWW(),width: BIG_ADD_BAR),
    WWidget(widget: LuzExtWW(),width: SMALL_ADD_BAR),
    WWidget(widget: LuzGenWW(),width: SMALL_ADD_BAR),
    WWidget(widget: LuzUpligthWW(),width: SMALL_ADD_BAR),

    WWidget(widget: LucesExterior(3),width: BIG_ADD_BAR),
    WWidget(widget: LucesCocina(2),width: BIG_ADD_BAR),
    WWidget(widget: LigthsBedroom(2),width: BIG_ADD_BAR),
    WWidget(widget: LucesBano(2),width: BIG_ADD_BAR),

    WWidget(widget: LucesSalon(2),width: BIG_ADD_BAR),
    WWidget(widget: Upligth(3),width: BIG_ADD_BAR),
         WWidget(widget: LuzGeneral(3),width: BIG_ADD_BAR),
    WWidget(widget: ModoLuz1(3),width: BIG_ADD_BAR),


    WWidget(widget: ModoLuz2(3),width: BIG_ADD_BAR),

    WWidget(widget: ModoPanelSolar(2),width: MID_ADD_BAR),
    WWidget(widget: ModoLimpiezaTuberias(2),width: MID_ADD_BAR),
    WWidget(widget: ModoLimpiezaCalefaccion(2),width: MID_ADD_BAR),
    WWidget(widget: ModoLargaDist(2),width: MID_ADD_BAR),

    WWidget(widget: ModoDescanso(2),width: MID_ADD_BAR),
    WWidget(widget: ModoAntiHeladasAuto(2),width: MID_ADD_BAR),
    WWidget(widget: Alarma(3),width: MID_ADD_BAR),

*/

/*
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
 */
  ];

  final List<Widget> carrouselList = [
   // widgetBoiler(1),
    //Calefaccion(1),
    //Inversor(1),
    //box225x140_1icon("VALVULAS",2.65 , "assets/icons/valvula.svg",false),
    //WWidget(wActive: AddWidget(),width: SMALL_ADD_BAR,wInactive:AddWidget()),
    AddWidget(),
  ];

  void addToCarrousel(WWidget item) {
    print("addToCarrousel");
    carrouselList.add(item.wActive);
    wwListStreamController.sink.add(wwList);
  }

  void removeFromCarrousel(WWidget item) {
    print("removeFromCart");
    carrouselList.remove(item.wActive);
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
        child: InkWell(
          splashColor: MyColors.inkSplashColor,
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



