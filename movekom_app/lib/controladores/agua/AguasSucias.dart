import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_sucias_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/aguas.dart';

import '../../app.localizations.dart';

class AguasSucias extends StatelessWidget {
  int widgetType;
  String title;
  AguasSucias(this.widgetType);
  AguasSuciasBloc aguasSuciasBloc;
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    SizeConfig().init(context);
    title = AppLocalizations.of(context)
        .translate("aguas_sucias");

     aguasSuciasBloc = BlocProvider.of<AguasSuciasBloc>(context);



    switch (widgetType){
      case 1:
        return aguas_sucias_principal();
        break;

      case 2:
        return aguas_sucias_grande();
        break;

      case 3:
        return valvula();
        break;

      case 4:
        return open();
        break;

      case 5:
        return close();
        break;
    }

  }

  Widget aguas_sucias_principal(){
    return
      BlocBuilder<AguasSuciasBloc,AguasSuciasState>(
          builder: ( context, state) {
            return Container(
                margin: EdgeInsets.all(SizeConfig.p * 0.7),
                width: SizeConfig.h * 11,
                height: SizeConfig.v * 18,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
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
                          child: agua_sucia_Img(state.valueAmp),
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


  Widget aguas_sucias_grande(){
    return
      BlocBuilder<AguasSuciasBloc,AguasSuciasState>(
          builder: ( context, state) {
            return MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                width: 200,
                height: 210,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
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
                          child: agua_sucia_Img(state.valueAmp),
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


  Widget valvula(){
    Color colorButton, colorImg;
    return
      BlocBuilder<AguasSuciasBloc,AguasSuciasState>(
          builder: ( context, state) {
            if(state.isEnabled){
              colorButton = Colors.lightGreenAccent;
              colorImg = Colors.white;
            }else{
              colorImg = Colors.grey;
              colorButton = Colors.white;
            }
            return MyContainer(
                margin: EdgeInsets.all(10),
                width: 200,
                height: 200,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(

                      /// Titulo
                      top: 4,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: MyTextStyle.estiloBold(
                                          15, Colors.white),
                                      text: "Aguas sucias"
                                  ),
                                ]
                            )
                        ),
                      ),
                    ),
                    MyPositioned.fill(
                      right: 2,
                      bottom: 5,
                      child: Align(
                          alignment: Alignment.center,
                          child: MyContainer(
                            height: 100,
                            width: 25,
                            decoration: new BoxDecoration(
                              color:state.isEnabled?  Colors.grey : MyColors.baseColor,
                            ),
                          )
                      ),
                    ),
                    MyPositioned.fill(
                      left: 25, top: 20,
                      /// Titulo
                      child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD(
                              "assets/icons/valvula.svg",colorImg, 80)
                      ),
                    ),
                  ],
                )
            );
          }
      );
  }


  Widget open(){
    String text = "ABRIR";
    return
      BlocBuilder<AguasSuciasBloc,AguasSuciasState>(
          builder: ( context, state) {
            return GestureDetector(
              onTap: (){
                aguasSuciasBloc.add(Enable());
              },
              child:  MyContainer(
                height: 80,
                width: 200,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Center(
                  child: Text(text,
                    style: MyTextStyle.estiloBold(15, Colors.white),),
                ),
              ),
            );
          }
      );
  }


  Widget close(){
    String text = "CERRAR";
    return
      BlocBuilder<AguasSuciasBloc,AguasSuciasState>(
          builder: ( context, state) {
            return GestureDetector(
              onTap: (){
                aguasSuciasBloc.add(Disable());
              },
              child:  MyContainer(
                height: 80,
                width: 200,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Center(
                  child: Text(text,
                    style: MyTextStyle.estiloBold(15, Colors.white),),
                ),
              ),
            );
          }
      );
  }


}
