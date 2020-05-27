import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_limpias_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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
    SC().init(context);
    SizeConfig().init(context);
    title = AppLocalizations.of(context)
        .translate("aguas_limpias");

     aguasLimpiasBloc = BlocProvider.of<AguasLimpiasBloc>(context);

     switch (widgetType){
       case 1:
         return aguas_limpias_principal();
         break;

       case 2:
         return aguas_limpias_grande();
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
  

    Widget aguas_limpias_principal(){
      return
        BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
            builder: ( context, state) {
            return MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                width: 130,
                height: 130,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                    children: [
                      MyPositioned.fill(/// Circulo
                        top: 27, bottom: 14,
                        child: Align(
                          alignment: Alignment.center,
                          child: agua_limpia_Img(state.valueAmp),
                        ),
                      ),
                      // Valvulas (Todas)
                      MyPositioned.fill(/// Titulo
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            12, MyColors.text),
                                        text: title
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ),
                      MyPositioned.fill(/// value
                        top: 15,
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            18, MyColors.text),
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


  Widget aguas_limpias_grande(){
    return
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
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
                                            SizeConfig.v * 2.2, MyColors.text),
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
                                            SizeConfig.v * 5, MyColors.text),
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
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
          builder: ( context, state) {
            if(state.isEnabled){
              colorButton = MyColors.principal;
              colorImg = MyColors.text;
            }else{
              colorImg = MyColors.inactive;
              colorButton = MyColors.text;
            }
          return Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                    top: 4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: MyTextStyle.estiloBold(
                                        15, MyColors.text),
                                    text: "Aguas limpias"
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
                            color:state.isEnabled?  Colors.blueAccent : MyColors.baseColor,
                          ),
                        )
                    ),
                  ),
                  MyPositioned.fill(
                    left: 25, top: 20,
                    child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD(
                            "assets/icons/valvula.svg", colorImg, 80)
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
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
        builder: ( context, state) {
          return GestureDetector(
            onTap: (){
                aguasLimpiasBloc.add(Enable());
            },
            child:  MyContainer(
            height: 80,
            width: 200,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
              child: Center(
                child: Text(text,
                  style: MyTextStyle.estiloBold(15, MyColors.text),),
              ),
          ),
          );
      }
      );
    }


  Widget close(){
    String text = "CERRAR";
    return
      BlocBuilder<AguasLimpiasBloc,AguasLimpiasState>(
          builder: ( context, state) {
            return GestureDetector(
              onTap: (){
                aguasLimpiasBloc.add(Disable());
              },
              child:  MyContainer(
                height: 80,
                width: 200,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Center(
                  child: Text(text,
                    style: MyTextStyle.estiloBold(15, MyColors.text),),
                ),
              ),
            );
          }
      );
  }

}
