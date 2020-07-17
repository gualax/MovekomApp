import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/agua_blocs/resistencia2_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Resistencia2 extends StatelessWidget {
  Resistencia2Bloc resistencia2bloc;
  @override
  Widget build(BuildContext context) {
    resistencia2bloc = BlocProvider.of<Resistencia2Bloc>(context);
    return resistencia2();
  }

  Widget resistencia2() {
    Color colorIcon;
    return BlocBuilder<BoilerBloc, BoilerState>(builder: (context, stateBloc) {
      return BlocBuilder<Resistencia2Bloc, Resistencia2State>(
          builder: (context, state) {
        Resistencia2Bloc resistencia2bloc =
            BlocProvider.of<Resistencia2Bloc>(context);
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
                resistencia2bloc.add(DisableRes2());
              } else {
                resistencia2bloc.add(EnableRes2());
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
                    left: 30,
                    top: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD(
                          "assets/icons/enchufe_boiler.svg", colorIcon, 50),
                    )),
                MyPositioned.fill(
                    right: 30,
                    top: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
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
