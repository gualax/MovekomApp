
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/indicador_rojo.dart';

class CargadorBaterias extends StatelessWidget {
  final String title = "Cargador de bateria";
  @override
  Widget build(BuildContext context) {
    final cargadorBateriaBloc = BlocProvider.of<CargadorBateriaBloc>(context);
    return cargador_bateria(cargadorBateriaBloc);
  }



  Widget cargador_bateria(cargadorBateriaBloc){
    Color iconColor,colorTex, circleColor;
    String on_off_Text;
    return
      BlocBuilder<CargadorBateriaBloc,CargadorBateriaState>(
        builder: ( context, state) {
          if(state.isEnabled){
            iconColor =  MyColors.principal;
            circleColor =  MyColors.principal;
            colorTex = MyColors.text;
            on_off_Text = "Pulsar para apagar";
          }else{
            colorTex = MyColors.inactive;
            circleColor = MyColors.inactive;
            iconColor = MyColors.text;
            on_off_Text = "Pulsar para encender";
          }
          return GestureDetector(
            onTap: (){
              if(state.isEnabled){
                cargadorBateriaBloc.add(DisableCargador());
              }else{
                cargadorBateriaBloc.add(EnableCargador());
              }
            },
            child: MyContainer(
              width: 420, height: 220,
              decoration: new BoxDecoration(
                color: MyColors.baseColor,
              ),
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      left: 10, top: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title,
                          style: MyTextStyle.estiloBold(20, colorTex),),
                      )
                  ),
                  MyPositioned.fill(
                    left: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(state.valueAmp.toString(),
                          style: MyTextStyle.estiloBold(60, colorTex),),
                      )
                  ),
                  MyPositioned.fill(
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/enchufe_cargador_acc.svg", colorTex, 60),
                      )
                  ),
                  MyPositioned.fill(
                    ///  /// valueAmp
                      bottom: 20,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                            on_off_Text,
                            style: MyTextStyle.estiloBold(15, colorTex),
                            textAlign: TextAlign.center
                        ),
                      )
                  ),
                  MyPositioned.fill(
                      right: 180, bottom: 5,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          icon: Icon(Icons.power_settings_new), iconSize: 30,
                          color: iconColor,
                          onPressed: () {
                            if(state.isEnabled){
                              cargadorBateriaBloc.add(DisableCargador());
                            }else{
                              cargadorBateriaBloc.add(EnableCargador());
                            }
                          },),
                      )
                  ),
                  MyPositioned.fill(
                    ///  /// valueAmp
                      top: 20, right: 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(20.0, circleColor),
                      )
                  ),
                  MyPositioned.fill(
                      bottom: 40, left: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: inidicadorRojoImg(state.valueAmp,45.0),
                      )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


}