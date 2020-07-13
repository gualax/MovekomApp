
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_antiheladas_automatico_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWModoAntiHeladasAuto extends StatelessWidget {
  bool isAdded;
  WWModoAntiHeladasAuto(this.isAdded);
  String title = "MODO ANTI HELADAS AUTOMATICO";

  ModoAntiHeladasAutoBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ModoAntiHeladasAutoBloc>(context);
    return _modo_anti_heladas_auto_ww();
  }

  Widget _modo_anti_heladas_auto_ww() {
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;

    return
      BlocBuilder<ModoAntiHeladasAutoBloc,ModoAntiHeladasAutoState>(
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
        tabChanger.changeTab(Constants.PAGE_MODES);
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
                    style: MyTextStyle.estilo(14,colorTxt),
                    textAlign:TextAlign.center,),
                )
            ),
            MyPositioned.fill(
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(10.0,colorIcon),
                )
            ),
            MyPositioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/modo_antIheladas_automatico.svg", colorIcon, 50),
                )
            ),
          ],
        ),
      ),
    );});
  }


}
