import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/agua_blocs/resistencia1_bloc.dart';
import 'package:movekomapp/blocs/agua_blocs/resistencia2_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';
import 'dart:math' as math;

import 'package:movekomapp/responsive_ui/mi_container.dart';


class Boiler extends StatefulWidget {


  @override
  _BoilerState createState() => _BoilerState();
}

class _BoilerState extends State<Boiler> {
int currentSelectedIndex;

BoilerBloc boilerBloc;
Resistencia1Bloc _resistencia1bloc;
Resistencia2Bloc _resistencia2bloc;

bool isFisrtRender = true;

  @override
  Widget build(BuildContext context) {
    _resistencia1bloc = BlocProvider.of<Resistencia1Bloc>(context);
    _resistencia2bloc = BlocProvider.of<Resistencia2Bloc>(context);
    return circularListBoiler();
  }

  Widget circularListBoiler() {
    //AnimatedBoiler animatedBoiler = AnimatedBoiler();
    return
      BlocBuilder<BoilerBloc,BoilerState>(
          builder: ( context, state) {
            boilerBloc = BlocProvider.of<BoilerBloc>(context);
            print("valueCord boiler: " + state.valueCord.toString());
            return MyContainer(
            //  color: Colors.amber,
              height: 400,
              width: 400,
              child:
              Center(
                child: Transform.rotate( /// ver si esto rota la felcha con el boiler poner dentro de AnimatedBoiler
                  angle: 0.5 * math.pi,
                child: CircleList(
               //  outerCircleColor: Colors.cyanAccent,
                 // innerCircleColor: Colors.white70,
                 // centerWidget: animatedBoiler,
                  rotateMode: RotateMode.stopRotate,
                  outerRadius: SC.all(170),//150
                  innerRadius: SC.all(95), //115 /// el problema es que si tapeo donde sta el inner circle no le llega a los hijos
                  origin: Offset(0, 0),
                  children: _radialListItems(),
            ),
            ),
              ),
            );
          }
      );
  }




List<Widget> _radialListItems() {
  return radialNumbers.items.map((RadialListItemViewModel viewModel) {
    final listItem =
        Transform.rotate(
        angle: 1.5 * math.pi,
        child: ItemBoiler(
      firstTime: getInitial(),
      listItem: viewModel,
      index: viewModel.number,
      isSelected: currentSelectedIndex == viewModel.number,
      onSelect: () {
         boilerBloc.add(Update(viewModel.number.toDouble()));
         _resistencia1bloc.add(DisableRes1());
         _resistencia2bloc.add(DisableRes2());
        setState(() {
          isFisrtRender = false;
          currentSelectedIndex = viewModel.number;
        });
      },
    )
        );
    return listItem;
  }).toList();
}

bool getInitial(){
  return isFisrtRender;
}

}
