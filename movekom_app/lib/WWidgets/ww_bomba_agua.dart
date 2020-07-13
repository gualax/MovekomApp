import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/agua_blocs/bomba_agua_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWBombaAgua extends StatelessWidget {
  bool isAdded;
  String title = "BOMBA DE AGUA";

  WWBombaAgua(this.isAdded);
  BombaAguaBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<BombaAguaBloc>(context);
    if(isAdded){
      return _ww_water_bombA();
    } else {
      return _ww_water_bombI();
    }
  }

  Widget _ww_water_bombA() {
    Color colorIcon, colorTxt;
    return
      BlocBuilder<BombaAguaBloc,BombaAguaState>(
          builder: ( context, state) {
            if (state.isEnabled) {
              colorIcon = MyColors.principal;
              colorTxt = MyColors.text;
            } else {
              colorIcon = MyColors.inactive;
              colorTxt = MyColors.inactive;
            }
            return GestureDetector(
              onTap: (){
                if (state.isEnabled) {
                  bloc.add(DisableBomba());
                } else {
                  bloc.add(EnableBomba());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_WATER);
              },
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 105.5,
                  height: 140,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill(/// circulito
                            top: 5, right: 5,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: circuloConSombra(12.0, colorIcon),
                            )
                        ),
                        MyPositioned.fill(/// Icono
                          top: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: iconSvgD(
                                "assets/images/water_1.svg",colorIcon, 60),
                          ),
                        ),
                        // Valvulas (Todas)
                        MyPositioned.fill(/// Titulo
                          top: 5,
                          left:10, right:17,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                              style: MyTextStyle.estiloBold(14,  colorTxt),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ])
              ),
            );
          }
      );
  }


  Widget _ww_water_bombI() {
    return  MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 105.5,
                  height: 140,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ),
                  child: Stack(
                      children: [
                        MyPositioned.fill(/// circulito
                            top: 5, right: 5,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: circuloConSombra(12.0, MyColors.text),
                            )
                        ),
                        MyPositioned.fill(/// Icono
                          top: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: iconSvgD(
                                "assets/images/water_1.svg", MyColors.text, 60),
                          ),
                        ),
                        // Valvulas (Todas)
                        MyPositioned.fill(/// Titulo
                          top: 5,
                          left:10, right:17,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                              style: MyTextStyle.estiloBold(14,  MyColors.text),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ])
              );
  }


}
