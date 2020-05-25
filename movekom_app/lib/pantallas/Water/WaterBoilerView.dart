


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/Boiler.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
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
    return MyContainer(
      alignment: Alignment.center,
      width: 720,
      height: 440,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: 20,
              left: 35,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "BOILER", style: MyTextStyle.estiloBold(30, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/fire.svg", Colors.lightGreenAccent, 150),
              )
          ),
          Positioned.fill(
              left: 100, bottom: 50,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(Icons.access_time,color: Colors.white), iconSize: 50),
              )
          ),
          Positioned.fill(
              left: 10,top: 30,
              child: Align(
                alignment: Alignment.topLeft,
                child: circuloConSombra(15.0, Colors.lightGreenAccent),
              )
          ),
          Positioned.fill(
              left: 100,
              bottom: 180,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/gota_agua.svg", Colors.lightGreenAccent, 80),
              )
          ),
          Positioned.fill(
              right: 280, top:20,
              child: Align(
                alignment: Alignment.center,
                child: Text("21",
                  style: MyTextStyle.estiloBold(100, Colors.white),),
              )
          ),
          Positioned.fill(
              right: 300,
              bottom: 100,
              child: Align(
                alignment: Alignment.center,
                child: Text("Temperatura,",
                  style: MyTextStyle.estilo(17, Colors.white),),
              )
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Boiler(),
              )
          ),
        ],
      ),
    );
  }
  

}

