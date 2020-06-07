
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_limpieza_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ModoLimpiezaTuberias extends StatelessWidget {
  String title = "MODO LIMPIEZA DE TUBERIAS";
  String description = "Modo de limpieza de tuberías de agua limpia automatizado. (Requiere el uso de producto Ambiti E-clean y una zona de desagüe bajo el vehiculo)";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return modo_descanso();
  }


  Widget modo_descanso() {
    Color colorIcon,colorIndic;
    return
      BlocBuilder<ModoLimpiezaBloc,ModoLimpiezaState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoLimpiezaBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
            }
            return  GestureDetector(
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
                          child: iconSvgD("assets/icons/modo_limpieza.svg", colorIndic, 55),
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