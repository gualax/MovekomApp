
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
  int widType;

  ModoLimpiezaTuberias(this.widType);

  @override
  Widget build(BuildContext context) {
    if(widType == 1){
      return modo_descanso();
    } else {
      return _modo_panel_solar_ww();
    }
  }


  Widget modo_descanso() {
    Color colorIcon,colorIndic;
    String on_off_text;
    return
      BlocBuilder<ModoLimpiezaBloc,ModoLimpiezaState>(
          builder: ( context, state) {
            final modoEcoBloc = BlocProvider.of<ModoLimpiezaBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorIndic = MyColors.principal;
              on_off_text = "Pulsar para apagar";
            }else{
              colorIcon = Colors.white;
              colorIndic = Colors.grey;
              on_off_text = "Pulsar para encender";

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
                margin: EdgeInsets.only(top: SC.top(5), bottom: SC.bot(5), left: SC.left(15), right: SC.right(15)),
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
                        left: 30, bottom: 13,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: iconSvgD("assets/icons/on_off.svg", colorIcon, 20),
                        )
                    ),
                    MyPositioned.fill(
                        bottom: 15, left: 15,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(on_off_text,
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




  Widget _modo_panel_solar_ww() {
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
                            textAlign:TextAlign.center ,),
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
                          child: iconSvgD("assets/icons/modo_limpieza.svg", MyColors.white, 50),
                        )
                    ),
                  ],

                ),
              ),
            );
  }
}