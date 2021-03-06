import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
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
            return GestureDetector(
              onTap: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(4);
              },
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(5)),
                  width: 212,
                  height: 282,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill(/// Circulo
                          top: 27, bottom: 14,
                          child: Align(
                            alignment: Alignment.center,
                            child: agua_sucia_Img(state.valueAmp),
                          ),
                        ),
                        // Valvulas (Todas)
                        MyPositioned.fill(/// Titulo
                          top: 5,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(title,
                                          style: MyTextStyle.estiloBold(
                                              MyTextStyle.TITLE_DIM, MyColors.text),
                                      ),),),
                        MyPositioned.fill(/// value
                          top: 15,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text( state.valueAmp.toString() + "%",
                                          style: MyTextStyle.estiloBold(
                                              45, MyColors.text),
                            ),
                          ),
                        ),
                        MyPositioned.fill(/// Circulo
                          bottom: 60,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child:iconSvgNc("assets/icons/warning.svg", 28),
                          ),
                        ),
                      ])
              ),
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
                      MyPositioned.fill(/// Circulo
                         top: 35,bottom: 10,  left: 5, right: 5,
                        child: Align(
                          alignment: Alignment.center,
                          child: agua_sucia_Img(state.valueAmp),
                        ),
                      ),
                      // Valvulas (Todas)
                      MyPositioned.fill(/// Titulo
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child:Text(title,
                                        style: MyTextStyle.estiloBold(
                                            20, MyColors.text),
                          ),
                        ),
                      ),
                      MyPositioned.fill(/// value
                        top: 5,
                        child: Align(
                          alignment: Alignment.center,
                          child:Text(state.valueAmp.toString() + "%",
                                        style: MyTextStyle.estiloBold(
                                            40, MyColors.text),
                          ),
                        ),
                      ),
                      MyPositioned.fill(/// Circulo
                        bottom: 35,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:iconSvgNc("assets/icons/warning.svg", 28),
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
              colorButton = MyColors.principal;
              colorImg = MyColors.text;
            }else{
              colorImg = MyColors.inactive;
              colorButton = MyColors.text;
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
                                          15, MyColors.text),
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
                              color:state.isEnabled?  MyColors.inactive : MyColors.baseColor,
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
                    style: MyTextStyle.estiloBold(15, MyColors.text),),
                ),
              ),
            );
          }
      );
  }


}
