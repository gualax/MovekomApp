import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/AnimatedBoiler.dart';
import 'package:movekomapp/controladores/agua/Boiler.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WaterBoilerView extends StatefulWidget {
  @override
  _WaterBoilerViewState createState() => _WaterBoilerViewState();
}

class _WaterBoilerViewState extends State<WaterBoilerView> {
  RadialListItemViewModel itemBoiler;

  @override
  Widget build(BuildContext context) {
    final boilerBloc = BlocProvider.of<BoilerBloc>(context);
    return boilerBox(boilerBloc);
  }

  Widget boilerBox(boilerBloc) {
    int index;
    Color colorIcon, colorText;
    return BlocBuilder<BoilerBloc, BoilerState>(builder: (context, state) {
      index = state.valueCord.round();
      radialNumbers.items.forEach((item) {
        if (item.number == index) {
          print(index);
          itemBoiler = item;
        }
      });
    if(state.valueCord.round() != 3){
      colorIcon = MyColors.principal;
      colorText = MyColors.text;
    } else {
      colorIcon = MyColors.inactive;
      colorText = MyColors.inactive;
    }
      return MyContainer(
        margin: EdgeInsets.all(SC.all(5)),
        alignment: Alignment.center,
        width: 720,
        height: 335, //335
        decoration: new BoxDecoration(color: MyColors.baseColor),
        child: MyContainer(
          child: Stack(
            children: <Widget>[
              MyPositioned.fill(
                  top: 20,
                  left: 35,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "BOILER",
                      style: MyTextStyle.estiloBold(30, colorText),
                    ),
                  )),
              MyPositioned.fill(
                  left: 20,
                  top: 70,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD(
                        "assets/icons/fire.svg",colorIcon, 120),
                  )),
              MyPositioned.fill(
                  left: 10,
                  top: 25,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: circuloConSombra(15.0, colorIcon),
                  )),
              MyPositioned.fill(
                  left: 90,
                  bottom: 70,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/gota_agua.svg",
                        colorIcon, 60),
                  )),
              MyPositioned.fill(
                  right: 260,
                  top: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      itemBoiler.valueTemp,
                      style: MyTextStyle.estiloBold(100, colorText),
                    ),
                  )),
              MyPositioned.fill(
                  right: 280,
                  bottom: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Temperatura,",
                      style: MyTextStyle.estilo(17, colorText),
                    ),
                  )),
              MyPositioned.fill(
                  left: 337,
                  bottom: 5, //300 //5
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedBoiler(190),
                  )),
              MyPositioned.fill(
                  left: 350,
                  bottom: 5, //300 //5
                  child: Align(
                    alignment: Alignment.center,
                    child: Boiler(),
                  )),
            ],
          ),
        ),
      );
    });
  }
  // AnimatedBoiler()



}
