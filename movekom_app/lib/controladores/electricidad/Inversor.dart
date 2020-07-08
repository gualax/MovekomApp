
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/inversor_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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
      return inversor_ww();
    }else if (widgetType == 2){
     return inversor_accesorios();
    } else {
      return inversor_ww_blank();
    }

  }

Widget inversor_accesorios(){
  Color iconColor,colorTex, circleColor;
  String on_off_Text;
  return
    BlocBuilder<InversorBloc,InversorState>(
      builder: ( context, state) {
        inversorBloc = BlocProvider.of<InversorBloc>(context);
      if(state.isEnabled){
        iconColor =  MyColors.principal;
        circleColor =  MyColors.principal;
        colorTex = MyColors.text;
        on_off_Text = "Pulsar para apagar";
      }else{
        colorTex = MyColors.inactive;
        circleColor = MyColors.inactive;
        iconColor = MyColors.text;
        on_off_Text = "Pulsar para encender";
      }
      return GestureDetector(
        onTap: (){
          if(state.isEnabled){
            inversorBloc.add(DisableInversor());
          }else{
            inversorBloc.add(EnableInversor());
          }
        },
        child: MyContainer(
          margin: EdgeInsets.all(SC.all(Dimens.TOOLS_SEPARATION)),
          width: 420, height: 220,
          decoration: new BoxDecoration(
            color: MyColors.baseColor,
          ),
          child: Stack(
            children: <Widget>[
              MyPositioned.fill(
                  left: 35,
                  top: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,
                      style: MyTextStyle.estiloBold(25, colorTex),),
                  )
              ),
              MyPositioned.fill(
                left: 90,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(state.valueAmp != 0 ? state.valueAmp.toString() : "--",
                      style: MyTextStyle.estiloBold(80, colorTex),),
                  )
              ),
              MyPositioned.fill( /// icon
                  left: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/pila_enchufe.svg", circleColor, 80),
                  )
              ),
              MyPositioned.fill(/// on_off_Text
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                        on_off_Text,
                        style: MyTextStyle.estiloBold(15, colorTex),
                        textAlign: TextAlign.center
                    ),
                  )
              ),
              MyPositioned.fill(/// consumo
                  bottom: 100, left: 90,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Consumo",
                        style: MyTextStyle.estilo(15, colorTex),
                        textAlign: TextAlign.center
                    ),
                  )
              ),
              MyPositioned.fill(
                  left: 100, bottom: 13,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: iconSvgD("assets/icons/on_off.svg", iconColor, 30),
                  )
              ),
              MyPositioned.fill(/// circulito
                  top: 20, right: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: circuloConSombra(20.0, circleColor),
                  )
              ),

            ],
          ),
        ),
      );
    }
  );
}


  Widget inversor_ww(){
    Color color;
    Color colorText;
    String on_off;
    return
      BlocBuilder<InversorBloc,InversorState>(
    builder: ( context, state) {
    if(state.isEnabled){
      color = MyColors.principal;
      colorText = MyColors.text;
      on_off = "ON";
    }else{
      color = MyColors.inactive;
      colorText = MyColors.inactive;
      on_off = "OFF";
    }

    return  ClipRect(
      child: MyContainer(
          margin: EdgeInsets.all(SC.all(7)),
          width: 225,
          height: 140,
          decoration: BoxDecoration(
              color: MyColors.baseColor
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            MyPositioned.fill(  ///titulo
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
            MyPositioned.fill(    ///textAbajoIzq
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
            MyPositioned.fill(  ///textAbajoDer
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
            MyPositioned.fill(  ///icon
              left: 30,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/bat_enchufe.svg", color, 60),
              ),
            ),
            MyPositioned.fill(    ///textAbajoIzq
              right: 65,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.valueAmp.toString(),
                  style: MyTextStyle.estiloBold(45, colorText),
                ),
              ),
            ),
            MyPositioned.fill(    ///textAbajoIzq
              right: 20,top:10,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Ah",
                  style: MyTextStyle.estiloBold(30, colorText),
                ),
              ),
            ),
            MyPositioned.fill(/// circulito
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


  Widget inversor_ww_blank(){
    String on_off;
    return
      BlocBuilder<InversorBloc,InversorState>(
          builder: ( context, state) {
            if(state.isEnabled){
              on_off = "ON";
            }else{
              on_off = "OFF";
            }
            return  ClipRect(
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 225,
                  height: 140,
                  decoration: BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(children: [
                    // Valvulas (Todas)
                    MyPositioned.fill(  ///titulo
                      top: 4,
                      left: 8,
                      child:   Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: MyTextStyle.estiloBold(18, MyColors.white),
                        ),
                      ),
                    ),
                    MyPositioned.fill(    ///textAbajoIzq
                      left: 8,
                      bottom: 6,
                      child:  Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          on_off,
                          style: MyTextStyle.estilo(18,  MyColors.white),
                        ),
                      ),
                    ),
                    MyPositioned.fill(  ///textAbajoDer
                      right: 8,
                      bottom: 6,
                      child:  Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Consumo" + "2.65"+ "A",
                          style: MyTextStyle.estilo(18,  MyColors.white),
                        ),
                      ),
                    ),
                    MyPositioned.fill(  ///icon
                      left: 30,
                      child:  Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/bat_enchufe.svg",  MyColors.white, 60),
                      ),
                    ),
                    MyPositioned.fill(    ///textAbajoIzq
                      right: 65,
                      child:  Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.valueAmp.toString(),
                          style: MyTextStyle.estiloBold(45,  MyColors.white),
                        ),
                      ),
                    ),
                    MyPositioned.fill(    ///textAbajoIzq
                      right: 20,top:10,
                      child:  Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Ah",
                          style: MyTextStyle.estiloBold(30,  MyColors.white),
                        ),
                      ),
                    ),
                    MyPositioned.fill(/// circulito
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(17.0,  MyColors.white),
                        )
                    ),
                  ])
              ),
            );
          }
      );
  }


}