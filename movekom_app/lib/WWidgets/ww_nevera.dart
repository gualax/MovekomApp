import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Constants.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/tab_changer.dart';
import 'package:movekomapp/blocs/electricidad_blocs/nevera_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WWNevera extends StatelessWidget {
  bool isAdded;
  String title = "NEVERA";

  WWNevera(this.isAdded);
  NeveraBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<NeveraBloc>(context);
    return nevera_widget();
  }


  Widget nevera_widget() {
    Color colorIcon = MyColors.white;
    Color colorTxt = MyColors.white;
    return
      BlocBuilder<NeveraBloc, NeveraState>(
          builder: (context, state) {
            bloc = BlocProvider.of<NeveraBloc>(context);
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
                  bloc.add(DisableNevera());
                } else {
                  bloc.add(EnableNevera());
                }
              },
              onLongPress: (){
                TabChanger tabChanger =  TabChanger(context);
                tabChanger.changeTab(Constants.PAGE_TOOLS);
              },
              child: MyContainer(
                  margin: EdgeInsets.all(SC.all(7)),
                  width: 105.5,
                  height: 140,
                  decoration: new BoxDecoration(
                      color: MyColors.baseColor
                  ), child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      top:5,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text("NEVERA",
                            style:MyTextStyle.estiloBold(15, colorTxt)),
                      )
                  ),
                  MyPositioned.fill(
                      top:5,
                      child: Align(
                        alignment: Alignment.center,
                        child: iconSvgD("assets/icons/nevera.svg", colorIcon, 70),
                      )
                  ),
                  MyPositioned.fill(
                      top:5, right: 5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(10, colorIcon),
                      )
                  ),
                ],
              )
              ),
            );
          }
      );
  }
}
