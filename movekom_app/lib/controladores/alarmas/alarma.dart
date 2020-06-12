import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/alarma_blocs/alarma_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Alarma extends StatelessWidget {
  AlarmaBloc alarmaBloc;

  @override
  Widget build(BuildContext context) {
    alarmaBloc = BlocProvider.of<AlarmaBloc>(context);
    return alarma();
  }


  Widget alarma() {
    Color colorIcon, colorText,colorPower;
    return
      BlocBuilder<AlarmaBloc, AlarmaState>(
          builder: (context, state) {
            if (state.isEnabled) {
              colorIcon = MyColors.principal;
              colorText = MyColors.text;
              colorPower = MyColors.principal;
            } else {
              colorIcon = MyColors.inactive;
              colorText = MyColors.inactive;
              colorPower = MyColors.text;

            }
            return GestureDetector(
              onTap: () {
                if (state.isEnabled) {
                  alarmaBloc.add(Disable());
                } else {
                  alarmaBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                height: 278,
                width: 278,
                color: MyColors.baseColor,
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                      top: 5, left: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("ALARMA",
                            style: MyTextStyle.estilo(18, colorText)),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: circuloConSombra(17, colorIcon),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 50, right: 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: iconSvgD(
                            "assets/icons/shield.svg",colorIcon, 125),
                      ),
                    ),
                    MyPositioned.fill(
                      top: 40, left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD(
                            "assets/icons/parking.svg",colorIcon,
                            120),
                      ),
                    ),
                    MyPositioned.fill(
                      bottom: 5, right: 160,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          icon: Icon(Icons.power_settings_new),
                          iconSize: SC.all(30),
                          color: colorPower,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    MyPositioned.fill(
                      bottom: 17, left: 20,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Pulsar para encender",
                            style: MyTextStyle.estilo(15, colorText)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
  }
}