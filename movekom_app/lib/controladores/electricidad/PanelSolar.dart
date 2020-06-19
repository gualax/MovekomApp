import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/panel_solar_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/amperimetro.dart';

class PanelSolar extends StatelessWidget {
  PanelSolar(this.widget);
  final int widget;
  final String title = "PANEL SOLAR";
  PanelSolarBloc panelSolarBloc;
  @override
  Widget build(BuildContext context) {
    panelSolarBloc = BlocProvider.of<PanelSolarBloc>(context);

   if(widget == 1){
      return panel_solar_widget();
   }else {
     return panel_solar_accesorios();
   }
  }

  Widget panel_solar_widget() {
    return
      BlocBuilder<PanelSolarBloc,PanelSolarState>(
          builder: ( context, state) {
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 200,
            height: 204,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                  right: 10,
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: amperimetroImg(state.valueAmp, SC.all(30)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(20, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        state.valueAmp.toString(),
                        style: MyTextStyle.estiloBold(55, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  top: 85,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Ah", style: MyTextStyle.estiloBold(30, MyColors.text)),
                  ),
                ),
                MyPositioned.fill(
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: iconSvgD(
                        "assets/icons/solar_panel_1.svg", MyColors.principal,
                        30),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }



  Widget panel_solar_accesorios(){
    Color iconColor,colorTex, circleColor;
    String on_off_Text;
    return
      BlocBuilder<PanelSolarBloc,PanelSolarState>(
          builder: ( context, state) {
            panelSolarBloc = BlocProvider.of<PanelSolarBloc>(context);
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
                  panelSolarBloc.add(DisablePanelSolar());
                }else{
                  panelSolarBloc.add(EnablePanelSolar());
                }
              },
              child: MyContainer(
                width: 420, height: 220,
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 10, top: 10,
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
                          child: Text(state.valueAmp.toString(),
                            style: MyTextStyle.estiloBold(80, colorTex),),
                        )
                    ),
                    MyPositioned.fill( /// icon
                        left: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: iconSvgD("assets/icons/solar_panel_1.svg", circleColor, 80),
                        )
                    ),
                    MyPositioned.fill(/// on_off_Text
                        bottom: 15,
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

}/// FIN clase

