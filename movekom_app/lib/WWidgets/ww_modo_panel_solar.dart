
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_panel_solar_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWModoPanelSolar extends StatelessWidget {
  bool isAdded;
  WWModoPanelSolar(this.isAdded);

  ModoPanelSolarBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ModoPanelSolarBloc>(context);
    return _modo_panel_solar_ww();
  }


  Widget _modo_panel_solar_ww() {
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;

    return
      BlocBuilder<ModoPanelSolarBloc,ModoPanelSolarState>(
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
            return InkWell(
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
                            "MODO SOLAR",
                            style: MyTextStyle.estilo(14, colorTxt),
                            textAlign:TextAlign.center ,),
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
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: iconSvgD("assets/icons/solar_panel_1.svg", colorIcon, 50),
                        )
                    ),
                  ],

                ),
              ),
            );
          });
  }

}
