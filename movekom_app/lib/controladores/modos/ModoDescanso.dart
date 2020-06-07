
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_descanso_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoDescanso extends StatelessWidget {
  String title = "MODO DESCANSO";
  String description = "Desactiva los equipos que generan ruido como inversor, bomba de agua etc.. ";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_descanso();
  }


  Widget modo_descanso() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoDescansoBloc,ModoDescansoState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoDescansoBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
            }else{
              colorIcon = MyColors.text;
              colorIndic = MyColors.inactive;
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
                margin: EdgeInsets.only(top: SC.top(10), left: SC.left(15), right: SC.right(15)),
                width: 210,
                height: 250,
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
                            title, style: MyTextStyle.estilo(16, MyColors.text),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(17.0, colorIndic),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/modo_descanso.svg", colorIndic, 55),
                        )
                    ),
                    MyPositioned.fill(
                        left: 10,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(Icons.power_settings_new),
                            iconSize: SC.all(30),
                            color: colorIcon,
                            onPressed: () {
                              if(state.isEnabled){
                                modoEcoBloc.add(Disable());
                              }else{
                                modoEcoBloc.add(Enable());
                              }
                            },
                          ),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 15, left: 15,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Presiona para encender",
                            style: MyTextStyle.estilo(12, MyColors.text),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(description,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.estilo(15, MyColors.text),),
                        )
                    ),
                  ],

                ),
              ),
            );
          });
  }
}