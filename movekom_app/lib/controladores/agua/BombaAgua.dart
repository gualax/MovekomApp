

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/blocs/agua_blocs/bomba_agua_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import '../../app.localizations.dart';

class BombaAgua extends StatelessWidget {
  int widgetType;
  String title;
  BombaAgua(this.widgetType);
  @override
  Widget build(BuildContext context) {
    title = AppLocalizations.of(context)
        .translate("bomba_de_agua");
    final bomabaAguaBloc = BlocProvider.of<BombaAguaBloc>(context);

    if(widgetType == 1){
      return WaterBomb_chica(bomabaAguaBloc);
    }else {
      return WaterBomb_grande(bomabaAguaBloc);
    }
  }


  Widget WaterBomb_grande(bomabaAguaBloc) {
    Color colorIcon, colorTxt, colorButton;
    String txtState;
    return
      BlocBuilder<BombaAguaBloc,BombaAguaState>(
          builder: ( context, state) {
            if (state.isEnabled) {
              txtState = "ON";
              colorIcon = Colors.lightGreenAccent;
              colorTxt = Colors.white;
              colorButton = Colors.lightGreenAccent;
            } else {
              txtState = "OFF";
              colorIcon = Colors.grey;
              colorButton = Colors.white;
              colorTxt = Colors.grey;
            }

            return Container(
                margin: EdgeInsets.only(right: 150),
                width: 220,
                height: 250,
                decoration: new BoxDecoration(
                    color: Color(0xff2d3033)
                ),
                child: Stack(
                    children: [
                      Positioned.fill(/// circulito
                          top: 10, right: 10,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(20.0, colorIcon),
                          )
                      ),
                      Positioned.fill(/// Icono
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD(
                              "assets/images/water_1.svg", colorIcon, 95),
                        ),
                      ),
                      // Valvulas (Todas)
                      Positioned.fill(/// Titulo
                        top: 7,
                        left:10 ,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            20, colorTxt),
                                        text: title),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(

                        /// OFF / ON
                        left: 10,
                        bottom: 4,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estilo(
                                            16, colorIcon),
                                        text: txtState),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(
                        ///amp
                        right: 10,
                        bottom: 4,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estilo(16, colorTxt),
                                        text: state.valueAmp.toString() + "A"),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(
                          bottom: 2,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                              icon: Icon(Icons.power_settings_new),
                              iconSize: 30,
                              color: colorButton,
                              onPressed: () {
                                if (state.isEnabled) {
                                  bomabaAguaBloc.add(Disable());
                                } else {
                                  bomabaAguaBloc.add(Enable());
                                }
                              },),
                          )
                      ),
                    ])
            );
          }
      );
  }


  Widget WaterBomb_chica(bomabaAguaBloc) {
    Color colorIcon, colorTxt, colorButton;
    String txtState;
    return
      BlocBuilder<BombaAguaBloc,BombaAguaState>(
          builder: ( context, state) {
            if (state.isEnabled) {
              txtState = "ON";
              colorIcon = Colors.lightGreenAccent;
              colorTxt = Colors.white;
              colorButton = Colors.lightGreenAccent;
            } else {
              txtState = "OFF";
              colorIcon = Colors.grey;
              colorButton = Colors.white;
              colorTxt = Colors.grey;
            }
            return Container(
                margin: EdgeInsets.all( 7),
                width: 137,
                height: 137,
                decoration: new BoxDecoration(
                    color: Color(0xff2d3033)
                ),
                child: Stack(
                    children: [
                      Positioned.fill(/// circulito
                          top: 10, right: 10,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(12.0, colorIcon),
                          )
                      ),
                      Positioned.fill(/// Icono
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD(
                              "assets/images/water_1.svg", colorIcon, 60),
                        ),
                      ),
                      // Valvulas (Todas)
                      Positioned.fill(/// Titulo
                        top: 7,
                        left:5 ,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            15, colorTxt),
                                        text: title),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(/// OFF / ON
                        left: 10,
                        bottom: 4,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estilo(
                                            14, colorIcon),
                                        text: txtState),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(///amp
                        right: 10,
                        bottom: 4,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estilo(14, colorTxt),
                                        text: state.valueAmp.toString() + "A"),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 10,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                              icon: Icon(Icons.power_settings_new),
                              iconSize: 20,
                              color: colorButton,
                              onPressed: () {
                                if (state.isEnabled) {
                                  bomabaAguaBloc.add(Disable());
                                } else {
                                  bomabaAguaBloc.add(Enable());
                                }
                              },),
                          )
                      ),
                    ])
            );
          }
      );
  }
}
