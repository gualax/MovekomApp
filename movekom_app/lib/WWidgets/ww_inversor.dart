import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/electricidad_blocs/inversor_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWInversor extends StatelessWidget {


  bool isAdded;
  String title = "INVERSOR";

  WWInversor(this.isAdded);
  InversorBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<InversorBloc>(context);
    return inversor_ww();
  }


  Widget inversor_ww(){
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    String on_off = "--";
    return
      BlocBuilder<InversorBloc,InversorState>(
          builder: ( context, state) {
            if(isAdded) {
              if (state.isEnabled) {
                colorIcon = MyColors.principal;
                colorTxt = MyColors.text;
                on_off = "ON";
              } else {
                colorIcon = MyColors.inactive;
                colorTxt = MyColors.inactive;
                on_off = "OFF";
              }
            }
            return GestureDetector(
              onTap: (){
                if (state.isEnabled) {
                  bloc.add(DisableInversor());
                } else {
                  bloc.add(EnableInversor());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_ELECTRICITY);
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
                      MyPositioned.fill(  ///titulo
                        top: 4,
                        left: 8,
                        child:   Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: MyTextStyle.estiloBold(18, colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(    ///textAbajoIzq
                        left: 8,
                        bottom: 6,
                        child:  Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            on_off,
                            style: MyTextStyle.estilo(18,  colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(  ///textAbajoDer
                        right: 8,
                        bottom: 6,
                        child:  Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Consumo" + "2.65"+ "A",
                            style: MyTextStyle.estilo(18, colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(  ///icon
                        left: 30,
                        child:  Align(
                          alignment: Alignment.centerLeft,
                          child: iconSvgD("assets/icons/bat_enchufe.svg", colorIcon, 60),
                        ),
                      ),
                      MyPositioned.fill(    ///textAbajoIzq
                        right: 65,
                        child:  Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            state.valueAmp.toString(),
                            style: MyTextStyle.estiloBold(45,  colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(    ///textAbajoIzq
                        right: 20,top:10,
                        child:  Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Ah",
                            style: MyTextStyle.estiloBold(30,  colorTxt),
                          ),
                        ),
                      ),
                      MyPositioned.fill(/// circulito
                          top: 10, right: 10,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(17.0,  colorIcon),
                          )
                      ),
                    ])
                ),
            );
          }
      );
  }


}

