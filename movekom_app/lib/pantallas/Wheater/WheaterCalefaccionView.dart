import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';

import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/clima_page_view_changer.dart';
import 'package:movekomapp/controladores/climatizacion/Calefaccion.dart';
import 'package:movekomapp/controladores/climatizacion/CalefaccionNew.dart';
import 'package:movekomapp/controladores/climatizacion/Extractor.dart';
import 'package:movekomapp/controladores/climatizacion/ExtractorNew.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_ext.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_int.dart';
import 'package:movekomapp/pantallas/Wheater/weather_box.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'WheaterHistoryView.dart';



class WheaterCalefactionView extends StatefulWidget {
  @override
  _WheaterCalefactionViewState createState() => _WheaterCalefactionViewState();
}

class _WheaterCalefactionViewState extends State<WheaterCalefactionView> {

  int _currentIndex = 0 ;
  List<Widget> children ;
  @override
  void initState() {
    // TODO: implement initState
   children =  <Widget>[
      contenido(),
      WheaterHistoryView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SC().init(context);
    return  contenido() ;
  }



  Widget contenido() {
    return Container(
     //   margin: EdgeInsets.only(top: SC.all(10)),
        // color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           // Calefaccion(2),
            CalefaccionNew(1),
            container(),
           // AireAcondicionado(2),
          ],
        ),
    );
  }


  Widget _show(int index) {
    print("show: " + _currentIndex.toString());
    return children[index];
  }


  Widget container() {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        WeatherBox(0,1),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TemperatureInt(2),
            TemperatureExt(2),
            // box247x144(),
          ],
        ) // box247x144(),
      ],
    ),
          ExtractorNew(),
          historialButton(),
        ],
      ),

    );
  }


  Widget historialButton(){
    return GestureDetector(
      onTap: (){
        ClimaPageChanger climaPageChanger =  ClimaPageChanger(context);
        climaPageChanger.changeTab(1);
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        height: 30,
        width: 450,
        color: MyColors.baseColor,
        child: Center(
          child: Text("HISTORIAL",
            style:MyTextStyle.estilo(20, MyColors.text),),
        ),
      ),
    );
  }


}
