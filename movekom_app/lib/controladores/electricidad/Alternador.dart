



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/alternador_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/amperimetro.dart';

class Alternador extends StatelessWidget {
  final String title = "ALTERNADOR ";
  @override
  Widget build(BuildContext context) {
    final alternadorBloc = BlocProvider.of<AlternadorBloc>(context);
    return alternador_widget(alternadorBloc);
  }


  Widget alternador_widget(alternadorBloc) {
    Color colorIcon, colorText;
    return
      BlocBuilder<AlternadorBloc,AlternadorState>(
          builder: ( context, state) {
          if(state.isEnabled){
            colorIcon = MyColors.principal;
            colorText = MyColors.text;
          } else {
            colorIcon = MyColors.inactive;
            colorText = MyColors.inactive;
          }
    return InkWell(
      splashColor: MyColors.principal,
      onTap: (){
            if(state.isEnabled){
              alternadorBloc.add(DisableInversor());
            } else {
              alternadorBloc.add(EnableInversor());
            }
          },
          child: MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 200,
            height: 198,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                  right: 10,
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: amperimetroImg(state.valueAmp, SC.all(30)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(title,
                        style: MyTextStyle.estiloBold(MyTextStyle.TITLE_DIM, colorText)),
                  ),
                ),
                MyPositioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        state.valueAmp != 0 ? state.valueAmp.toString() : "--",
                        style: MyTextStyle.estiloBold(55, colorText)),
                  ),
                ),
                MyPositioned.fill(
                  top: 85,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "A", style: MyTextStyle.estiloBold(30, colorText)),
                  ),
                ),
                MyPositioned.fill(
                  left: 10,
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: iconSvgD(
                        "assets/icons/engine_motor.svg",colorIcon,
                        30),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

}/// FIN clase

