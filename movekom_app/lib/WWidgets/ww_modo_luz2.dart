import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/mode2_bloc.dart';
import 'package:movekomapp/blocs/p_widget_list.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWModoLuz2 extends StatelessWidget {

  bool isAdded;
  WWModoLuz2(this.isAdded);
  Mode2Bloc bloc;
  String title = "MODO 2";

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<Mode2Bloc>(context);
    return _modo_luz_2_ww();
  }

  Widget _modo_luz_2_ww(){
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<Mode2Bloc,Mode2State>(
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
                  bloc.add(DisableMode2());
                } else {
                  bloc.add(Enable());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_LIGHTS);
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                width: 225,
                height: 140,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: [
                    MyPositioned.fill(
                      top: 20, right: 30,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: iconSvgD("assets/icons/letter_m.svg",colorIcon, 70),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 20, left: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/lampara.svg",colorIcon, 60),
                      ),
                    ),
                    MyPositioned.fill(
                        top: 10, left: 10,
                        child: Text(title,
                            style:MyTextStyle.estilo(18, colorTxt))
                    ),
                    MyPositioned.fill(
                        right: 10, top: 10,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(15, colorIcon))
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }
}
