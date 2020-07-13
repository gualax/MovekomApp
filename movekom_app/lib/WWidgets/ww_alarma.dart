
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/alarma_blocs/alarma_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WWAlarma extends StatelessWidget {
  bool isAdded;
  WWAlarma(this.isAdded);
  String title = "ALARMA";

  AlarmaBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<AlarmaBloc>(context);
    return _alarma_ww();
  }


  Widget _alarma_ww() {
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<AlarmaBloc,AlarmaState>(
    builder: ( context, state) {
      if(isAdded) {
        if (state.isEnabled) {
          colorIcon = MyColors.principal;
          colorTxt = MyColors.text;
        } else {
          colorIcon = MyColors.inactive;
          colorTxt = MyColors.inactive;
        }
      }
    return  InkWell(
        splashColor: MyColors.principal,
        onTap: (){
          if (state.isEnabled) {
            bloc.add(Disable());
          } else {
            bloc.add(Enable());
          }
        },
      onLongPress: (){
        TabChanger tabChanger =  TabChanger(context);
        tabChanger.changeTab(Constants.PAGE_ALARM);
      },
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 105.5,
        height: 140,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                left: 10, top: 5, right: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: MyTextStyle.estilo(14, colorTxt),
                    textAlign:TextAlign.center,),
                )
            ),
            MyPositioned.fill(
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(10.0, colorIcon),
                )
            ),
            MyPositioned.fill(
              left: 30,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD(
                    "assets/icons/shield.svg",colorIcon, 40),
              ),
            ),
            MyPositioned.fill(
                bottom: 20, right: 30,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/parking.svg", colorIcon, 40),
                )
            ),
          ],

        ),
      ),
    );});
  }



}
