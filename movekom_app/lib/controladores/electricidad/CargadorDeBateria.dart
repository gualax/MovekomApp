
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

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
            iconColor =  Colors.lightGreen;
            circleColor =  Colors.lightGreen;
            colorTex = Colors.white;
            on_off_Text = "Pulsar para apagar";
          }else{
            colorTex = Colors.grey;
            circleColor = Colors.grey;
            iconColor = Colors.white;
            on_off_Text = "Pulsar para encender";
          }
          return Container(
            width: 350, height: 220,
            decoration: new BoxDecoration(
              color: Color(0xff2d3033),
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    left: 10, top: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(title,
                        style: MyTextStyle.estiloBold(20, colorTex),),
                    )
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(state.valueAmp.toString(),
                        style: MyTextStyle.estiloBold(60, colorTex),),
                    )
                ),
                Positioned.fill(
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/cable.svg", colorTex, 60),
                    )
                ),
                Positioned.fill(

                  ///  /// valueAmp
                    bottom: 20, left: 60,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          on_off_Text,
                          style: MyTextStyle.estiloBold(12, colorTex),
                          textAlign: TextAlign.center
                      ),
                    )
                ),
                Positioned.fill(
                    left: 15, bottom: 5,
                    child: Align(
                      alignment: Alignment.bottomLeft,
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
                Positioned.fill(

                  ///  /// valueAmp
                    bottom: 20, left: 250, right: 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                          "Establecer temporizacion",
                          style: MyTextStyle.estiloBold(12, colorTex),
                          textAlign: TextAlign.center
                      ),
                    )
                ),
                Positioned.fill(

                  ///  /// valueAmp
                    bottom: 42, right: 38,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.access_time), iconSize: 30,
                        color: colorTex, onPressed: () {},),
                    )
                ),
                Positioned.fill(

                  ///  /// valueAmp
                    top: 20, right: 20,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: circuloConSombra(20.0, circleColor),
                    )
                ),
              ],
            ),
          );
        }
    );
  }


}