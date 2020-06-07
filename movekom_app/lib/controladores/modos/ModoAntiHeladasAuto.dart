
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_antiheladas_automatico_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoAntiHeladasAuto extends StatelessWidget {
  String title = "MODO ANTI HELADAS AUTOMATICO";
  String description = "Controla la temperatura externa e interna y gestiona el uso de boiler y calefaccion para evitar congelamiento de sistemas críticos del vehiculo.";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_antiheladas_automatico();
  }


  Widget modo_antiheladas_automatico() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoAntiHeladasAutoBloc,ModoAntiHeladasAutoState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoAntiHeladasAutoBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
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
                            title, style: MyTextStyle.estilo(16, Colors.white),),
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
                          child: iconSvgD("assets/icons/modo_antIheladas_automatico.svg", colorIndic, 55),
                        )
                    ),
                    MyPositioned.fill(
                      bottom: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("A",
                            style: MyTextStyle.estiloBold(15, MyColors.text),),
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
                            style: MyTextStyle.estilo(12, Colors.white),),
                        )
                    ),
                    MyPositioned.fill(
                        top: 75, left: 10, right: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(description,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.estilo(13, Colors.white),),
                        )
                    ),
                  ],

                ),
              ),
            );
          });
  }
}