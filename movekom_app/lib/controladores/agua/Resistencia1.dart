import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/agua_blocs/resistencia1_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Resistencia1 extends StatelessWidget {
  Resistencia1Bloc resistencia1bloc;

  @override
  Widget build(BuildContext context) {
    resistencia1bloc = BlocProvider.of<Resistencia1Bloc>(context);
    return resistencia1();
  }

  Widget resistencia1() {
    Color colorIcon;
    return BlocBuilder<BoilerBloc, BoilerState>(
        builder: (context, stateBloc) {
      return BlocBuilder<Resistencia1Bloc, Resistencia1State>(
          builder: (context, state) {
        if (state.isEnabled) {
          colorIcon = MyColors.principal;
        } else {
          colorIcon = MyColors.inactive;
        }
        return InkWell(
          splashColor: MyColors.principal,
          onTap: () {
            if (stateBloc.valueCord.abs() != 3) {
              if (state.isEnabled) {
                resistencia1bloc.add(DisableRes1());
              } else {
                resistencia1bloc.add(EnableRes1());
              }
            }
          },
          child: MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 175,
            height: 90,
            decoration: new BoxDecoration(color: MyColors.baseColor),
            child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                    top: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: iconSvgD(
                          "assets/icons/enchufe_boiler.svg", colorIcon, 50),
                    )),
                MyPositioned.fill(
                    top: 5,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Resistencia electrica 1",
                        style: MyTextStyle.estilo(12, MyColors.text),
                      ),
                    )),
                MyPositioned.fill(
                    top: 5,
                    right: 5,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: circuloConSombra(10, colorIcon),
                    )),
              ],
            ),
          ),
        );
      });
    });
  }
}
