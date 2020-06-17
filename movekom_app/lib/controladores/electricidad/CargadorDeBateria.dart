
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/indicador_rojo.dart';

class CargadorBaterias extends StatelessWidget {
  final String title = "CARGADOR DE BATERIA";
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
              margin: EdgeInsets.all(SC.all(5)),
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
                          style: MyTextStyle.estiloBold(25, colorTex),),
                      )
                  ),
                  MyPositioned.fill(
                    left: 90,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(state.valueAmp.toString(),
                          style: MyTextStyle.estiloBold(80, colorTex),),
                      )
                  ),
                  MyPositioned.fill(
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/enchufe_cargador_acc.svg", iconColor, 60),
                      )
                  ),
                  MyPositioned.fill(/// consumo
                      bottom: 100, left: 90,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            "Carga A",
                            style: MyTextStyle.estilo(15, colorTex),
                            textAlign: TextAlign.center
                        ),
                      )
                  ),
                  MyPositioned.fill(
                    ///  /// valueAmp
                      bottom: 15,
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
                      left: 110, bottom: 13,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: iconSvgD("assets/icons/on_off.svg", iconColor, 30),
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
                ],
              ),
            ),
          );
        }
    );
  }


}