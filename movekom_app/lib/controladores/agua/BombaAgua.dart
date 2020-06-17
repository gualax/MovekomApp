

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/agua_blocs/bomba_agua_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import '../../app.localizations.dart';

class BombaAgua extends StatelessWidget {
  int widgetType;
  String title;
  BombaAgua(this.widgetType);
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    title = "BOMBA DE AGUA";
    final bomabaAguaBloc = BlocProvider.of<BombaAguaBloc>(context);

    if(widgetType == 1){
      return WaterBomb_principal(bomabaAguaBloc);
    }else {
      return WaterBomb_water(bomabaAguaBloc);
    }
  }


  Widget WaterBomb_water(bomabaAguaBloc) {
    Color colorIcon, colorTxt, colorButton;
    String txtState;
    return
      BlocBuilder<BombaAguaBloc,BombaAguaState>(
          builder: ( context, state) {
            if (state.isEnabled) {
              txtState = "ON";
              colorIcon = MyColors.principal;
              colorTxt = MyColors.text;
              colorButton = MyColors.principal;
            } else {
              txtState = "OFF";
              colorIcon = MyColors.inactive;
              colorButton = MyColors.text;
              colorTxt = MyColors.inactive;
            }

            return GestureDetector(
              onTap: (){
                if (state.isEnabled) {
                  bomabaAguaBloc.add(Disable());
                } else {
                  bomabaAguaBloc.add(Enable());
                }
              },
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 200,
                  height: 210,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill(/// circulito
                            top: 10, right: 10,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: circuloConSombra(18.0, colorIcon),
                            )
                        ),
                        MyPositioned.fill(/// Icono
                          bottom: 5,
                          child: Align(
                            alignment: Alignment.center,
                            child: iconSvgD(
                                "assets/images/water_1.svg", colorIcon, 90),
                          ),
                        ),
                        // Valvulas (Todas)
                        MyPositioned.fill(/// Titulo
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
                        MyPositioned.fill(
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
                        MyPositioned.fill(
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
                        MyPositioned.fill(
                            bottom: 15,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: iconSvgD("assets/icons/on_off.svg", colorButton, 25)
                            )
                        ),
                      ])
              ),
            );
          }
      );
  }


  Widget WaterBomb_principal(bomabaAguaBloc) {
    Color colorIcon, colorTxt, colorButton;
    String txtState;
    return
      BlocBuilder<BombaAguaBloc,BombaAguaState>(
          builder: ( context, state) {
            if (state.isEnabled) {
              txtState = "ON";
              colorIcon = MyColors.principal;
              colorTxt = MyColors.text;
              colorButton = MyColors.principal;
            } else {
              txtState = "OFF";
              colorIcon = MyColors.inactive;
              colorButton = MyColors.text;
              colorTxt = MyColors.inactive;
            }
            return GestureDetector(
              onTap: (){
                if (state.isEnabled) {
                  bomabaAguaBloc.add(Disable());
                } else {
                  bomabaAguaBloc.add(Enable());
                }
              },
              child: MyContainer(
                  margin: EdgeInsets.all(7),
                  width: 130,
                  height: 130,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill(/// circulito
                            top: 10, right: 10,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: circuloConSombra(12.0, colorIcon),
                            )
                        ),
                        MyPositioned.fill(/// Icono
                          top: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: iconSvgD(
                                "assets/images/water_1.svg", colorIcon, 70),
                          ),
                        ),
                        // Valvulas (Todas)
                        MyPositioned.fill(/// Titulo
                          top: 7,
                          left:10, right:10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                              style: MyTextStyle.estiloBold(14, colorTxt),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        MyPositioned.fill(/// OFF / ON
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
                      ])
              ),
            );
          }
      );
  }
}
