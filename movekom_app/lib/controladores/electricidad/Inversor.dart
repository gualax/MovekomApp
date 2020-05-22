
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/electricidad_blocs/inversor_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/indicador_rojo.dart';
import 'package:movekomapp/widgets/temporizador_popup.dart';

class Inversor extends StatelessWidget {
  final String title = "INVERSOR";
  final int widgetType;
  InversorBloc inversorBloc;

  Inversor(this.widgetType);

  @override
  Widget build(BuildContext context) {
    if(widgetType == 1){
      return inversor_wodget();
    }else{
     return inversor_big();
    }

  }

Widget inversor_big(){
  Color iconColor,colorTex, circleColor;
  String on_off_Text;
  return
    BlocBuilder<InversorBloc,InversorState>(
      builder: ( context, state) {
        inversorBloc = BlocProvider.of<InversorBloc>(context);
      if(state.isEnabled){
        iconColor =  Colors.lightGreen;
        circleColor =  Colors.lightGreen;
        colorTex = Colors.white;
        on_off_Text = "Pulsar para apagar";
      }else{
        colorTex = Colors.grey;
        circleColor = Colors.grey;
        iconColor = Colors.white;
        on_off_Text = "Pulsar para encender";
      }
      return Container(
        width: 350, height: 220,
        decoration: new BoxDecoration(
          color: MyColors.ContainerColor,
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                left: 10, top: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(title,
                    style: MyTextStyle.estiloBold(20, colorTex),),
                )
            ),
            Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(state.valueAmp.toString(),
                    style: MyTextStyle.estiloBold(60, colorTex),),
                )
            ),
            Positioned.fill(
                left: 20,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconSvgD("assets/icons/cable.svg", colorTex, 60),
                )
            ),
            Positioned.fill(/// valueAmp
                bottom: 20, left: 60,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      on_off_Text,
                      style: MyTextStyle.estiloBold(12, colorTex),
                      textAlign: TextAlign.center
                  ),
                )
            ),
            Positioned.fill(
                left: 15, bottom: 5,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(Icons.power_settings_new), iconSize: 30,
                    color: iconColor,
                    onPressed: () {
                    if(state.isEnabled){
                      inversorBloc.add(DisableInversor());
                    }else{
                      inversorBloc.add(EnableInversor());
                    }
                  },),
                )
            ),
            Positioned.fill(/// temporizacion
                bottom: 20, left: 250, right: 20,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      "Establecer temporizacion",
                      style: MyTextStyle.estiloBold(12, colorTex),
                      textAlign: TextAlign.center
                  ),
                )
            ),
            Positioned.fill(/// icono timer
                bottom: 42, right: 38,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.access_time), iconSize: 30,
                    color: colorTex, onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => TemporizadorPopup(),
                    );
                  },),
                )
            ),
            Positioned.fill(/// circulito
                top: 20, right: 20,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(20.0, circleColor),
                )
            ),
            Positioned.fill(
                bottom: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: inidicadorRojoImg(state.valueAmp,45.0),
                )
            ),
          ],
        ),
      );
    }
  );
}


  Widget inversor_wodget(){
    Color color;
    Color colorText;
    String on_off;
    return
      BlocBuilder<InversorBloc,InversorState>(
    builder: ( context, state) {
    if(state.isEnabled){
      color = Colors.lightGreenAccent;
      colorText = Colors.white;
      on_off = "ON";
    }else{
      color = Colors.grey;
      colorText = Colors.grey;
      on_off = "OFF";
    }

    return  ClipRect(
      child: Container(
          margin: EdgeInsets.all(7),
          width: 225,
          height: 140,
          decoration: BoxDecoration(
              color: MyColors.ContainerColor
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            Positioned.fill(  ///titulo
              top: 4,
              left: 8,
              child:   Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: MyTextStyle.estiloBold(18, colorText),
                ),
              ),
            ),
            Positioned.fill(    ///textAbajoIzq
              left: 8,
              bottom: 6,
              child:  Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  on_off,
                  style: MyTextStyle.estilo(18, color),
                ),
              ),
            ),
            Positioned.fill(  ///textAbajoDer
              right: 8,
              bottom: 6,
              child:  Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Consumo" + "2.65"+ "A",
                  style: MyTextStyle.estilo(18, colorText),
                ),
              ),
            ),
            Positioned.fill(  ///icon
              left: 30,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/bat_enchufe.svg", color, 60),
              ),
            ),
            Positioned.fill(    ///textAbajoIzq
              right: 65,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.valueAmp.toString(),
                  style: MyTextStyle.estiloBold(45, colorText),
                ),
              ),
            ),
            Positioned.fill(    ///textAbajoIzq
              right: 20,top:10,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Ah",
                  style: MyTextStyle.estiloBold(30, colorText),
                ),
              ),
            ),
            Positioned.fill(/// circulito
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(17.0, color),
                )
            ),
          ])
      ),
    );
    }
    );
  }


}