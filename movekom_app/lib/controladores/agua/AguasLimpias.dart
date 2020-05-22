import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_limpias_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/aguas.dart';
import 'package:rxdart/rxdart.dart';

import '../../app.localizations.dart';

class AguasLimpias extends StatelessWidget {
  int widgetType;
  String title;
  AguasLimpias(this.widgetType);
  AguasLimpiasBloc  aguasLimpiasBloc;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    title = AppLocalizations.of(context)
        .translate("aguas_limpias");

     aguasLimpiasBloc = BlocProvider.of<AguasLimpiasBloc>(context);

    if (widgetType == 1) {
      return aguas_limpias_chica(aguasLimpiasBloc);
    } else  if (widgetType == 2){
      return aguas_limpias_grande(aguasLimpiasBloc);
    }else {
      return valvula(aguasLimpiasBloc);
    }
  }
  

    Widget aguas_limpias_chica(aguasLimpiasBloc){
      return
        BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
            builder: ( context, state) {
            return Container(
                margin: EdgeInsets.all(SizeConfig.p * 0.7),
                width: SizeConfig.h * 11,
                height: SizeConfig.v * 18,
                decoration: new BoxDecoration(
                    color: MyColors.ContainerColor
                ),
                child: Stack(
                    children: [
                      Positioned.fill(/// Circulo
                        top:  SizeConfig.v * 4,
                        bottom: SizeConfig.v * 1,
                        left: SizeConfig.h * 1,
                        right: SizeConfig.h * 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: agua_limpia_Img(state.valueAmp),
                        ),
                      ),
                      // Valvulas (Todas)
                      Positioned.fill(/// Titulo
                        top: SizeConfig.v * 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            SizeConfig.v * 2, Colors.white),
                                        text: title
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(/// value
                        top: SizeConfig.v * 2.5,
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            SizeConfig.v * 3.5, Colors.white),
                                        text: state.valueAmp.toString() + "%"
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ),
                    ])
            );
          }
        );
    }


  Widget aguas_limpias_grande(aguasLimpiasBloc){
    return
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
          builder: ( context, state) {
            return Container(
                margin: EdgeInsets.all(SizeConfig.p * 0.7),
                width: SizeConfig.h * 16,
                height: SizeConfig.v * 26,
                decoration: new BoxDecoration(
                    color: MyColors.ContainerColor
                ),
                child: Stack(
                    children: [
                      Positioned.fill(/// Circulo
                        top:  SizeConfig.v * 5,
                        bottom: SizeConfig.v * 2,
                        left: SizeConfig.h * 1,
                        right: SizeConfig.h * 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: agua_limpia_Img(state.valueAmp),
                        ),
                      ),
                      // Valvulas (Todas)
                      Positioned.fill(/// Titulo
                        top: SizeConfig.v * 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            SizeConfig.v * 2.2, Colors.white),
                                        text: title
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(/// value
                        top: SizeConfig.v * 2.5,
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            SizeConfig.v * 5, Colors.white),
                                        text: state.valueAmp.toString() + "%"
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ),
                    ])
            );
          }
      );
  }


   Widget valvula(aguasLimpiasBloc){
    Color colorButton, colorImg;
    return
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
          builder: ( context, state) {
            if(state.isEnabled){
              colorButton = Colors.lightGreenAccent;
              colorImg = Colors.white;
            }else{
              colorImg = Colors.grey;
              colorButton = Colors.white;
            }
          return Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              decoration: new BoxDecoration(
                  color: MyColors.ContainerColor
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    top: 4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: MyTextStyle.estiloBold(
                                        15, Colors.white),
                                    text: "Aguas limpias"
                                ),
                              ]
                          )
                      ),
                    ),
                  ),
                  Positioned.fill(
                    left: 25,
                    child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD(
                            "assets/icons/valvula.svg", colorImg, 80)
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
                              aguasLimpiasBloc.add(Disable());
                            } else {
                              aguasLimpiasBloc.add(Enable());
                            }
                          },),
                      )
                  ),
                ],
              )
          );
        }
    );
  }

}
