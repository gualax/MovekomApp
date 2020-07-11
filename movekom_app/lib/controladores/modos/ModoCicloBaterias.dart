
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/more_info_popup.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_ciclo_baterias.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoCicloBaterias extends StatelessWidget {
  String title = "MODO CICLO BATERIAS";
  String description = "Ciclado de batería para eliminar el efecto memoria, la duración mínima son 10 días. El equipo debe estar conectado a la red eléctrica (220V)";
  String iconRoute = "assets/icons/ciclado_bat.svg";
  @override
  Widget build(BuildContext context) {
    return modo_larga_dist();
  }


  Widget modo_larga_dist() {
    Color colorIcon,colorText,colorPower;
    return
      BlocBuilder<ModoCicloBatBloc,ModoCicloBatState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoCicloBatBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorText = MyColors.text;
              colorPower = MyColors.principal;
            }else{
              colorPower = Colors.white;
              colorText = MyColors.inactive;
              colorIcon = MyColors.inactive;
            }
            return InkWell(
              splashColor: MyColors.principal,
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
}