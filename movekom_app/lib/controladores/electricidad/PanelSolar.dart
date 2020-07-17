import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
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
   }else if (widget == 2){
     return panel_solar_accesorios();
   }else {
     return solar_box(12.5.toString(),context);
   }
  }

  Widget panel_solar_widget() {
    Color colorText, colorIcon;
    return
      BlocBuilder<PanelSolarBloc,PanelSolarState>(
          builder: ( context, state) {
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorText = MyColors.text;
            } else {
              colorIcon = MyColors.inactive;
              colorText = MyColors.inactive;
            }
          return InkWell(
            splashColor: MyColors.inkSplashColor,
            onTap: (){
              if(state.isEnabled){
                panelSolarBloc.add(DisablePanelSolar());
              } else {
                panelSolarBloc.add(EnablePanelSolar());
              }
            },
            child: MyContainer(
              margin: EdgeInsets.all(SC.all(5)),
              width: 200,
              height: 198,
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
                      child: amperimetroImg((state.valueAmp.truncate() * 10), SC.all(30)),
                    ),
                  ),
                  MyPositioned.fill(
                    top: 10,
                    left: 10,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(title,
                          style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, colorText)),
                    ),
                  ),
                  MyPositioned.fill(
                    top: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          state.valueAmp != 0 ? state.valueAmp.toString() : "--",
                          style: MyTextStyle.estiloBold(55, colorText)),
                    ),
                  ),
                  MyPositioned.fill(
                    top: 85,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          "A", style: MyTextStyle.estiloBold(30, colorText)),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 10,
                    bottom: 20,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: iconSvgD(
                          "assets/icons/solar_panel_1.svg", colorIcon, 30),
                    ),
                  ),
                ],
              ),
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
            return InkWell(
              splashColor: MyColors.inkSplashColor,
              onTap: (){
                if(state.isEnabled){
                  panelSolarBloc.add(DisablePanelSolar());
                }else{
                  panelSolarBloc.add(EnablePanelSolar());
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
                          child: Text(state.valueAmp != 0 ? state.valueAmp.toString() : "--",
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


  Widget solar_box(valueAh,context){
    return GestureDetector(
      onTap: (){
        TabChanger tabChanger = new TabChanger(context);
        tabChanger.changeTab(2);
      },
      child: MyContainer(
          margin: EdgeInsets.all(SC.all(4)),
          width: 100,
          height: 89,
          decoration: new BoxDecoration(
              color: MyColors.baseColor
          ), child: Stack(children: [
        MyPositioned.fill( /// titulo
          top: 4,
          child: Align(
            alignment: Alignment.topCenter,
            child:Text(
              "SOLAR",
              style:MyTextStyle.estiloBold(16, MyColors.text),
            ),
          ),
        ),
        MyPositioned.fill(
          top:10,
          child: Align(
            alignment: Alignment.center,
            child: Text(valueAh,
              style:MyTextStyle.estiloBold(20, MyColors.principal),
            ),
          ),
        ),
        MyPositioned.fill(
          left: 55,
          child: Align(
            alignment: Alignment.center,
            child: Text("A",
              style:MyTextStyle.estiloBold(13, MyColors.principal),
            ),
          ),
        ),
      ])
      ),
    );
  }

}/// FIN clase

