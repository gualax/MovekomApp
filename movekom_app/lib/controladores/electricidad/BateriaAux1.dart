
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/HomePage.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/electricidad_blocs/bateria_aux_1_bloc.dart';
import 'package:movekomapp/blocs/tab_bloc.dart';
import 'package:movekomapp/main.dart';
import 'package:movekomapp/pantallas/Electricity/ElectricityMenuPage.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class BateriaMotorAux1 extends StatelessWidget {
  int widgetType;
  final String title = "BATERIA AUXILIAR";
  BateriaMotorAux1(this.widgetType);
  @override
  Widget build(BuildContext context) {
    final bateriaAux1Bloc = BlocProvider.of<BateriaAux1Bloc>(context);
    if (widgetType == 1) {
      return bateria_aux_principal(bateriaAux1Bloc);
    } else {
      return box200x215_bateria(bateriaAux1Bloc);
    }
  }

  Widget box200x215_bateria(bateriaAux1Bloc) {
    Color color;
    Color colorText;
    Color iconColor;
    String on_off_Text;
    return
      BlocBuilder<BateriaAux1Bloc,BateriaAux1State>(
          builder: ( context, state) {
            print(state.isEnabled);
            print(state.valueBat);
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
                  bateriaAux1Bloc.add(DisableBatery());
                } else {
                  bateriaAux1Bloc.add(EnableBatery());
                }
              },
              child: MyContainer(
                  margin: EdgeInsets.all(5),
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
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                icon: Icon(Icons.power_settings_new),
                                iconSize: SC.all(30),
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
              ),
            );
          }
      );
  }





  Widget bateria_aux_principal(bateriaAux1Bloc){
    Color colorIcon, colorText;

    return
      BlocBuilder<BateriaAux1Bloc,BateriaAux1State>(
          builder: ( context, state) {
          if(state.isEnabled){
            colorIcon = MyColors.principal;
            colorText = MyColors.text;
          }else{
            colorText = MyColors.inactive;
            colorIcon = MyColors.inactive;
          }
          return GestureDetector(
            onTap: (){

             TabChanger tabChanger =  TabChanger(context);
             tabChanger.changeTab(2);
              // no es la mejor solucion
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(indexPage: 2,)));
/*
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => HomePage(indexPage: 2,)),
                    (Route<dynamic> route) => false,
              );
*/
              },
            child: MyContainer(
                margin: EdgeInsets.only(bottom: SC.bot(15)),
                width: 288, height:200, //200 //288
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                child: Stack(
                    children: [
                      MyPositioned.fill(
                        /// valor bateria
                        left: 5,top:20,
                        child: Align(
                          alignment: Alignment.center,
                          child: circleIndicatorBatery_small(state.valueBat, colorIcon, SC.all(80),SC.all(150), state.valueVolt.toStringAsFixed(1)),
                        ),
                      ),
                      MyPositioned.fill(
                        /// titulo
                        top: 4, left: 10,
                        child: Align(
                          alignment: Alignment.topLeft,
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
            ),
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


  Widget circleIndicatorBatery_small(value,color,radius,innerRadius,valueVolt){
    return Container (
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          circulito(radius,color),
          circleIndicatorBateriaAux(value, color,innerRadius,valueVolt)
        ],
      ),
    );
  }




} /// FIN DE CLASE