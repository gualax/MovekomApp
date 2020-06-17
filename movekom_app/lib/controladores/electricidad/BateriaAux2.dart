
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/blocs/electricidad_blocs/bateria_aux_2_bloc.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BateriaMotorAux2 extends StatelessWidget {
  int widgetType;
  final String title = "Bateria Aux 2";

  BateriaMotorAux2(this.widgetType);
  @override
  Widget build(BuildContext context) {
    final bateriaAux2Bloc = BlocProvider.of<BateriaAux2Bloc>(context);
    if (widgetType == 1) {
      return box137x137_Bateria(bateriaAux2Bloc);
    } else {
      return box200x215_bateria(bateriaAux2Bloc);
    }
  }

  Widget box200x215_bateria(bateriaAux1Bloc) {
    Color color;
    Color colorText;
    Color iconColor;
    String on_off_Text;
    return
      BlocBuilder<BateriaAux2Bloc,BateriaAux2State>(
          builder: ( context, state) {
            if (state.isEnabled) {
              color = Colors.lightGreen;
              colorText = Colors.white;
              iconColor = color;
              on_off_Text = "Pulsar para apagar bateria";
            } else {
              color = Colors.grey;
              colorText = Colors.grey;
              iconColor = Colors.white;
              on_off_Text = "Pulsar para encender bateria";
            }
            return Container(
                margin: EdgeInsets.all(5),
                width: 200,
                height: 214,
                decoration: new BoxDecoration(
                    color: Color(0xff2d3033)
                ),
                child: Stack(
                    children: [
                      Positioned.fill(
                        /// valor bateria
                        right: 20,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: circleIndicatorBatery_big(state.valueBat, color,56.0),
                        ),
                      ),
                      Positioned.fill(

                        /// titulo
                        top: 4,
                        left: 10,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(
                                            20, colorText),
                                        text: title),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Positioned.fill(

                        /// valueVolt
                        left: 7,
                        bottom: 30,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              state.valueVolt.toString() + "V",
                              style: MyTextStyle.estiloBold(16, colorText),
                              textAlign: TextAlign.center
                          ),
                        ),
                      ),
                      Positioned.fill(

                        ///  /// valueAmp
                          top: 30,
                          left: 7,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                state.valueAmp.toString() + "A",
                                style: MyTextStyle.estiloBold(16, colorText),
                                textAlign: TextAlign.center
                            ),
                          )
                      ),
                      Positioned.fill(

                        ///  /// valueAmp
                          bottom: 20,
                          left: 30,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                                on_off_Text,
                                style: MyTextStyle.estiloBold(12, colorText),
                                textAlign: TextAlign.center
                            ),
                          )
                      ),
                      Positioned.fill(
                          right: 170,
                          bottom: 5,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                              icon: Icon(Icons.power_settings_new),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {
                                if (state.isEnabled) {
                                  bateriaAux1Bloc.add(DisableBatery());
                                } else {
                                  bateriaAux1Bloc.add(EnableBatery());
                                }
                              },
                            ),
                          )
                      )
                    ])
            );
          }
      );
  }





  Widget box137x137_Bateria(bateriaAux1Bloc){
    return
      BlocBuilder<BateriaAux2Bloc,BateriaAux2State>(
          builder: ( context, state) {
            Color color;
            if(state.isEnabled){
              color = Colors.lightGreen;
            }else{
              color = Colors.grey;
            }
            return Container(
                margin: EdgeInsets.all(7),
                width: 137,
                height: 137,
                decoration: new BoxDecoration(
                    color: Color(0xff2d3033)
                ),
                child: Stack(
                    children: [
                      Positioned.fill(

                        /// valor bateria
                        left: 5,
                        child: Align(
                          alignment: Alignment.center,
                          child: circleIndicatorBatery_small(state.valueBat, color, 42.0),
                        ),
                      ),
                      Positioned.fill(
                        /// titulo
                        top: 4,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(15, color),
                                        text: title),
                                  ]
                              )
                          ),
                        ),
                      ),
                      PositionedDirectional(

                        /// valueVolt
                        bottom: 4,
                        start: 10,
                        child: Text(
                            state.valueVolt.toString(),
                            style: MyTextStyle.estilo(15, color),
                            textAlign: TextAlign.center
                        ),
                      ),
                      PositionedDirectional(

                        ///  /// valueAmp
                          bottom: 4,
                          end: 10,
                          child: Text(
                              state.valueAmp.toString(),
                              style: MyTextStyle.estilo(15, color),
                              textAlign: TextAlign.center
                          )
                      )
                    ])
            );
          }
      );
  }




  Widget circleIndicatorBatery_big(value,color,radius){
    return Container (
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          circulito(radius,color),
          circleIndicator_big(value, color)
        ],
      ),
    );
  }


  Widget circleIndicatorBatery_small(value,color,radius){
    return Container (
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          circulito(radius,color),
          circleIndicator(value, color)
        ],
      ),
    );
  }

} /// FIN DE CLASE