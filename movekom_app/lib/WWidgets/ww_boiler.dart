import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWBoiler extends StatelessWidget {
  bool isAdded;
  WWBoiler(this.isAdded);
  RadialListItemViewModel itemBoiler;

  BoilerBloc bloc;
  String title = "BOILER";

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<BoilerBloc>(context);
    return boiler_ww();
  }

  Widget boiler_ww() {
    int index;
    String on_off ="ON";
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<BoilerBloc, BoilerState>(
          builder: (context, state) {
            index = state.valueCord.round();
            radialNumbers.items.forEach((item) {
              if (item.number == index) {
                print(index);
                itemBoiler = item;
              }
            });
            if(isAdded) {
              if (index != 3) {
                colorIcon = MyColors.principal;
                colorTxt = MyColors.text;
              } else {
                on_off = "OFF";
                colorIcon = MyColors.inactive;
                colorTxt = MyColors.inactive;
              }
            }
            index = state.valueCord.round();
            radialNumbers.items.forEach((item) {
              if (item.number == index) {
                print(index);
                itemBoiler = item;
              }
            });
            return
              InkWell(
                splashColor: MyColors.principal,
                onTap: (){

                },
                onLongPress: (){
                  TabChanger tabChanger =  TabChanger(context);
                  tabChanger.changeTab(Constants.PAGE_WATER);
                },
                child: MyContainer(
                    margin: EdgeInsets.all(SC.all(7)),
                    width: 225,
                    height: 140,
                    decoration: BoxDecoration(
                        color: MyColors.baseColor
                    ),
                    child: Stack(children: [
                      // Valvulas (Todas)
                      MyPositioned.fill(
                        top: 4,
                        left: 8,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: MyTextStyle.estiloBold(18, colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(
                        /// circulito
                          top: 10, right: 10,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(17.0,
                                colorIcon),
                          )
                      ),
                      MyPositioned.fill(

                        ///textAbajoIzq
                        left: 8,
                        bottom: 6,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            on_off,
                            style: MyTextStyle.estilo(18, colorIcon),
                          ),
                        ),
                      ),
                      MyPositioned.fill(

                        ///textAbajoDer
                        right: 8,
                        bottom: 6,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            index != 3 ? "Consumo " + "2.65" + "A" : "Consumo " + "--" + "A" ,
                            style: MyTextStyle.estilo(18, colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(
                        ///icon
                        left: 25,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: iconSvgD(
                              itemBoiler.iconRoute, colorIcon, 40),
                        ),
                      ),
                      MyPositioned.fill(
                        ///textValue
                        right: 40,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            itemBoiler.valueTemp != 0 ? itemBoiler.valueTemp.toString() : "--",
                            style: MyTextStyle.estiloBold(45, colorTxt),
                          ),
                        ),
                      ),
                    ])
                ),
              );
          }
      );
  }
}

