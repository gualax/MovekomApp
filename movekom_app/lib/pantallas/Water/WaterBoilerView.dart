


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/Boiler.dart';
import 'package:movekomapp/controladores/agua/Boiler3.dart';
import 'package:movekomapp/controladores/agua/item_boiler.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WaterBoilerView extends StatefulWidget {
  @override
  _WaterBoilerViewState createState() => _WaterBoilerViewState();
}

class _WaterBoilerViewState extends State<WaterBoilerView> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   final boilerBloc = BlocProvider.of<BoilerBloc>(context);
    return boilerBox(boilerBloc);
  }

  Widget boilerBox(boilerBloc) {
    return Container(
      alignment: Alignment.center,
      width: 900,
      height: 474,
      decoration: new BoxDecoration(
          color: Color(0xff1c1c1c)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: 20,
              left: 30,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "BOILER", style: MyTextStyle.estiloBold(30, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/fire.svg", Colors.lightGreenAccent, 200),
              )
          ),
          Positioned.fill(
              left: 160,
              bottom: 200,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/gota_agua.svg", Colors.lightGreenAccent, 100),
              )
          ),
          Positioned.fill(
              right: 160,
              bottom: 100,
              child: Align(
                alignment: Alignment.center,
                child: Text("21",
                  style: MyTextStyle.estiloBold(150, Colors.white),),
              )
          ),
          Positioned.fill(
              right: 220,
              bottom: 260,
              child: Align(
                alignment: Alignment.center,
                child: Text("Temperatura,",
                  style: MyTextStyle.estilo(25, Colors.white),),
              )
          ),
          Positioned.fill(
            left: 410,
              child: Align(
                alignment: Alignment.centerRight,
             //   child: AnimatedBoiler(),
              )
          ),
          Positioned.fill(
              right: 20,
              child: Align(
                alignment: Alignment.centerRight,
                child: Boiler3(),
                //child: newCirlceList(100.0),
              )
          ),
        ],

      ),
    );
  }

  /*
  *             child: Boiler(
                  radialList: radialNumbers,
                ),
  * */

}

