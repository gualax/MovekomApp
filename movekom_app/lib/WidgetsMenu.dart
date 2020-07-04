import 'package:flutter/material.dart';
import 'package:movekomapp/controladores/electricidad/CargadorDeBateria.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/barra_add_ww.dart';
import 'package:movekomapp/ww/luz_exterior_widget.dart';
import 'package:movekomapp/ww/luz_general_widget.dart';
import 'package:movekomapp/ww/upligth_widget.dart';
import 'Utils/MyColors.dart';
import 'Utils/SC.dart';
import 'controladores/agua/BombaAgua.dart';
import 'controladores/agua/ItemBoiler.dart';
import 'controladores/alarmas/alarma.dart';
import 'controladores/climatizacion/Calefaccion.dart';
import 'controladores/iluminacion/LigthsBedRoom.dart';
import 'controladores/iluminacion/LucesBano.dart';
import 'controladores/iluminacion/LucesCocina.dart';
import 'controladores/iluminacion/LucesExterior.dart';
import 'controladores/iluminacion/LucesSalon.dart';
import 'controladores/iluminacion/LuzGeneral.dart';
import 'controladores/iluminacion/ModoLuz1.dart';
import 'controladores/iluminacion/ModoLuz2.dart';
import 'controladores/iluminacion/Upligth.dart';
import 'controladores/modos/ModoAntiHeladasAuto.dart';
import 'controladores/modos/ModoDescanso.dart';
import 'controladores/modos/ModoLargaDist.dart';
import 'controladores/modos/ModoLimpiezaCalef.dart';
import 'controladores/modos/ModoLimpiezaTuberias.dart';
import 'controladores/modos/ModoPanelSolar.dart';
import 'ww/temperature_widget.dart';
import 'controladores/electricidad/Inversor.dart';
import 'controladores/nevera/nevera.dart';

class WidgetsMenu extends StatefulWidget {
  @override
  _WidgetsMenuState createState() => _WidgetsMenuState();
}

class _WidgetsMenuState extends State<WidgetsMenu> {
  @override
  Widget build(BuildContext context) {
    return _buildAboutDialog2();
  }

  Widget _buildAboutDialog2() {
    return new AlertDialog(
      backgroundColor: Colors.black,

      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('WIDGETS',
                    style:MyTextStyle.estiloBold(30, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('RPZ ONE',
                    style:MyTextStyle.estilo(20, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              top: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: MyContainer(
                  height: 3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
            ),
        MyPositioned.fill(
          top: 80,
          child: Align(
            child: MyContainer(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    row1(),
                    row2(),
                    row3(),
                    row4(),
                    row5(),
                    row6(),
                  ],
                ),
              ),
            ),
          ),
        ),
            MyContainer(
                child: MyPositioned.fill(
                  right: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: MyContainer(
                        height: 45,
                        width: 45,
                        child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 20),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }


  Widget row1(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddBig(widgetBoiler(2)),
        withAddBig(Calefaccion(3)),
        withAddBig(Inversor(3)),
        withAddBig(CargadorBaterias(3)),
      ],
    );
}

Widget withAddBig(widget){
    return MyContainer(
      width: 240,
      height: 185,
      margin: EdgeInsets.only(bottom: SC.bot(7)),
      child: Stack(
        children: <Widget>[
          widget,
          Align(
            alignment: Alignment.bottomCenter,
              child: AddWWBar()),
        ],
      ),
    );
}
  Widget withAddMed(widget){
    return MyContainer(
      margin: EdgeInsets.only(bottom: SC.bot(7)),
      width: 120,
      height: 185,
      child: Stack(
        children: <Widget>[
          widget,
          Align(
              alignment: Alignment.bottomCenter,
              child: AddWWBar()),
        ],
      ),
    );
  }
  Widget withAddSmall(widget){
    return MyContainer(
      margin: EdgeInsets.only(bottom: SC.bot(7)),
      width: 80,
      height: 185,
      child: Stack(
        children: <Widget>[
          widget,
          Align(
              alignment: Alignment.bottomCenter,
              child: AddWWBar()),
        ],
      ),
    );
  }

  Widget row2(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddBig(WeatherBox(0,2)),
        withAddMed(Nevera(3)),
        withAddMed(BombaAgua(3)),
        withAddBig(TemperatureWW()),
        withAddSmall( LuzExtWW()),
        withAddSmall(LuzGenWW()),
        withAddSmall(LuzUpligthWW()),
      ],
    );
  }

  Widget row3(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddBig(LucesExterior(3)),
        withAddBig(LucesCocina(2)),
        withAddBig(LigthsBedroom(2)),
        withAddBig(LucesBano(2)),
      ],
    );
  }

  Widget row4(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddBig(LucesSalon(2)),
        withAddBig(Upligth(3)),
        withAddBig(LuzGeneral(3)),
        withAddBig(ModoLuz1(3)),
      ],
    );
  }

  Widget row5(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddBig(ModoLuz2(3)),
        withAddMed(ModoPanelSolar(2)),
        withAddMed(ModoLimpiezaTuberias(2)),
        withAddMed(ModoLimpiezaCalefaccion(2)),
        withAddMed(ModoLargaDist(2)),
        withAddMed(ModoDescanso(2)),
        withAddMed(ModoAntiHeladasAuto(2)),
      ],
    );
  }

  Widget row6(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        withAddMed(Alarma(3)),
      ],
    );
  }

  Widget item(){
    return MyContainer(
      height: 100,
      width: 100,
      child:iconSvgD(
          "assets/icons/pdf_view.svg",
          Colors.white, 15),
    );
  }


}





