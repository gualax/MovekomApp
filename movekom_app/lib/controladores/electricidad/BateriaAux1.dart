
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
import 'package:movekomapp/widgets/IconSvg.dart';
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
    return
      BlocBuilder<BateriaAux1Bloc,BateriaAux1State>(
          builder: ( context, state) {
            print(state.isEnabled);
            print(state.valueBat);
            if (state.isEnabled) {
              color = MyColors.principal;
              colorText = MyColors.text;
            } else {
              color = MyColors.inactive;
              colorText = MyColors.inactive;
            }
            return GestureDetector(
              onTap: (){
                /*
                if (state.isEnabled) {
                  bateriaAux1Bloc.add(DisableBatery());
                } else {
                  bateriaAux1Bloc.add(EnableBatery());
                }
                 */
              },
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(5)),
                  width: 200,
                  height: 198,
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
                        MyPositioned.fill(/// titulo
                          top: 4,
                          left: 10,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(title, style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, colorText),),
                          ),
                        ),
                        MyPositioned.fill(
                          left: 15,
                          bottom: 70,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("MAX",
                              style: MyTextStyle.estilo(16, colorText),
                            ),
                          ),
                        ),
                        MyPositioned.fill(

                          /// valueVolt
                          left: 10,
                          bottom: 30,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              state.valueVolt.toString() + "V",
                              style: MyTextStyle.estilo(16, colorText),
                            ),
                          ),
                        ),
                        MyPositioned.fill(
                            top: 50,
                            left: 15,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("MIN",
                                style: MyTextStyle.estilo(16, colorText),
                              ),
                            )
                        ),
                        MyPositioned.fill(
                            top: 90,
                            left: 10,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.valueAmp.toString() + "V",
                                style: MyTextStyle.estilo(16, colorText),
                              ),
                            )
                        ),
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
              },
            child: MyContainer(
                margin: EdgeInsets.all(SC.all(5)),
                width: 212, height:282, //200 //288
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
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, colorText),
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