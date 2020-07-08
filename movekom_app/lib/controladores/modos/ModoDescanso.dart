
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/Utils/more_info_popup.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_descanso_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoDescanso extends StatelessWidget {
  String title = "MODO DESCANSO";
  String description = "Desactiva los equipos que generan ruido como inversor, bomba de agua etc.. ";
  int widgetType;
  String iconRoute = "assets/icons/modo_descanso.svg";

  ModoDescanso(this.widgetType);
  @override
  Widget build(BuildContext context) {
    if(widgetType == 1){
      return modo_descanso();
    } else {
      return _modo_descanso_ww();
    }
  }


  Widget modo_descanso() {
    Color colorIcon,colorText,colorPower;
    return
      BlocBuilder<ModoDescansoBloc,ModoDescansoState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoDescansoBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorText = MyColors.text;
              colorPower = MyColors.principal;
            }else{
              colorPower = Colors.white;
              colorText = MyColors.inactive;
              colorIcon = MyColors.inactive;
            }
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  modoEcoBloc.add(Disable());
                }else{
                  modoEcoBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(Dimens.MODES_SEPARATION)),
                width: 210,
                height: 230,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 10, top: 5,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title, style: MyTextStyle.estilo(16, Colors.white),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(17.0, colorIcon),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD(iconRoute, colorIcon, 55),
                        )
                    ),
                    MyPositioned.fill(
                        top: 55,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/on_off.svg", colorPower, 35),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 50,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: MyContainer(
                            height: 3,
                            width: 190,
                            color: colorText,
                          ),
                        )
                    ),
                    MyPositioned.fill(
                      bottom: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("+ INFO",
                          style: MyTextStyle.estilo(20, colorPower) ,),
                      ),
                    ),
                    MyPositioned.fill(
                        bottom: 5,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: (){
                              showDialog (
                                context: context,
                                builder: (BuildContext context) => MoreInfoPopup(title,description),
                              );
                            },
                            child: MyContainer(
                              height: 40,
                              width: 200,
                              color: Colors.transparent,
                            ),
                          ),
                        )
                    ),
                  ],

                ),
              ),

            );
          });
  }


  Widget _modo_descanso_ww() {
    return  GestureDetector(
      onTap: (){
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 105.5,
        height: 140,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                left: 10, top: 5, right: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: MyTextStyle.estilo(14, Colors.white),
                    textAlign:TextAlign.center,),
                )
            ),
            MyPositioned.fill(
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(10.0, MyColors.white),
                )
            ),
            MyPositioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/modo_descanso.svg", MyColors.white, 50),
                )
            ),
          ],

        ),
      ),
    );
  }

}