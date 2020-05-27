
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConf.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/electricidad_blocs/bateria_motor_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class BateriaMotor extends StatelessWidget {
  int widgetType;
  final String title = "Bateria Motor";

  BateriaMotor(this.widgetType);
  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    final bateriaMotorBloc = BlocProvider.of<BateriaMotorBloc>(context);
    if (widgetType == 1) {
      return bateria_motor_principal(bateriaMotorBloc);
    } else {
      return bateria_motor(bateriaMotorBloc);
    }
  }
  
    Widget bateria_motor(bateriaMotorBloc) {
      Color color;
      Color colorText;
      Color iconColor;
      String on_off_Text;
      return
        BlocBuilder<BateriaMotorBloc,BateriaMotorState>(
            builder: ( context, state) {
              if (state.isEnabled) {
                color = MyColors.principal;
                colorText = MyColors.text;
                iconColor = color;
                on_off_Text = "Desconectar";
              } else {
                color = MyColors.inactive;
                colorText = MyColors.inactive;
                iconColor = MyColors.text;
                on_off_Text = "Conectar";
              }
              return GestureDetector(
                onTap: (){
                  if (state.isEnabled) {
                    bateriaMotorBloc.add(DisableBatery());
                  } else {
                    bateriaMotorBloc.add(EnableBatery());
                  }
                },
                child: MyContainer(
                    margin: EdgeInsets.all(SC.all(5)),
                    width: 200,
                    height: 210,
                    decoration: new BoxDecoration(
                        color: MyColors.baseColor
                    ),
                    child: Stack(
                        children: [
                          MyPositioned.fill(
                            /// valor bateria
                            right: 20,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: circleIndicatorBatery_big(state.valueBat, color,SC.all(56),SC.all(100)),
                            ),
                          ),
                          MyPositioned.fill(
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
                          MyPositioned.fill(
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
                          MyPositioned.fill(

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
                          MyPositioned.fill(

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
                          MyPositioned.fill(
                              right: 170,
                              bottom: 5,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  icon: Icon(Icons.power_settings_new),
                                  iconSize: SC.all(30),
                                  color: iconColor,
                                  onPressed: () {
                                    if (state.isEnabled) {
                                      bateriaMotorBloc.add(DisableBatery());
                                    } else {
                                      bateriaMotorBloc.add(EnableBatery());
                                    }
                                  },
                                ),
                              )
                          )
                        ])
                ),
              );
            }
        );
    }





    Widget bateria_motor_principal(bateriaMotorBloc){
      return
        BlocBuilder<BateriaMotorBloc,BateriaMotorState>(
            builder: ( context, state) {
              Color color, colorText;
              if(state.isEnabled){
                color = Colors.lightGreen;
                colorText = MyColors.text;
              }else{
                color = Colors.grey;
                colorText = MyColors.inactive;

              }
              return MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 137, //137
                  height:137,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill( /// icono bateria
                          top: 10,
                          child: Align(
                            alignment: Alignment.center,
                            child: circleIndicatorBatery_small(state.valueBat, color, SizeConf.all(50),SizeConf.all(90)),
                          ),
                        ),
                        MyPositioned.fill(/// titulo
                          top:4,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          style: MyTextStyle.estiloBold(15, colorText),
                                          text: title),
                                    ]
                                )
                            ),
                          ),
                        ),
                      ])
              );
            }
        );
    }




    Widget circleIndicatorBatery_big(value,color,radius,innerRadius){
      return Container (
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            circulito(radius,color),
            indicadorCircularLleno(value, color,innerRadius)
          ],
        ),
      );
    }


    Widget circleIndicatorBatery_small(value,color,radius,innerRadius){
      return Container (
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            circulito(radius,color),
            circleIndicatorBateria(value, color,innerRadius)
          ],
        ),
      );
    }

  } /// FIN DE CLASE
