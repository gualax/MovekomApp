

import 'package:circle_list/circle_list.dart';
import 'package:circle_list/radial_drag_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/item_boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/AnimatedBoiler.dart';
import 'package:movekomapp/controladores/agua/item_boiler.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import '../../app.localizations.dart';
import 'items_boiler/boiler_modo_1.dart';

class Boiler2 extends StatelessWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    title = AppLocalizations.of(context)
        .translate("bomba_de_agua");
    final boilerBloc = BlocProvider.of<BoilerBloc>(context);

    return circularListBoiler(boilerBloc);
  }


  Widget circularListBoiler(boilerBloc) {
    AnimatedBoiler animatedBoiler = AnimatedBoiler();
    PolarCoord _lastCord;
    return
      BlocBuilder<BoilerBloc,BoilerState>(
          builder: ( context, state) {
        return Container(
          child: CircleList(
            centerWidget: animatedBoiler,
            rotateMode: RotateMode.stopRotate,
            outerRadius: 220,
            innerRadius: 120,
            origin: Offset(0, 0),
            children: _radialListItems(),
          ),
        );
      }
    );
  }
/*
  List.generate(10, (index) {
  return Icon(
  Icons.details,
  color: index % 2 == 0 ? Colors.blue : Colors.orange,
  );
*/

  Widget iconBuble(int dpas,boilerBloc,iconRoute) {
    Color color;
          return
            BlocBuilder<ItemBoilerBloc,ItemBoilerState>(
                builder: ( context, state) {
             final itemBoilerBloc = BlocProvider.of<ItemBoilerBloc>(context);
             if (state.isEnabled) {
               color = Colors.lightGreenAccent;
             } else {
               color = Colors.white;
             }
             return GestureDetector(
              onTap: () {
                boilerBloc.add(Update(dpas.toDouble()));
               itemBoilerBloc.add(EnableItemBoiler());
              }, child: Container(
               width: 83,
               height: 83,
               alignment: Alignment.center,
                child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child:Align(
                      alignment: Alignment.center,
                      child: iconSvgD(iconRoute, color, 40)
                  ),
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(dpas.toString(),style: MyTextStyle.estiloBold(10, Colors.white),),
                    )
                )
              ],
            ),
            ),
          );
                }
          );
  }


  List<Widget> itemList = [
    iconBuble2(6, "assets/icons/icon_boiler_6.svg"),
    iconBuble2(7, "assets/icons/icon_boiler_5.svg"),
    iconBuble2(0, "assets/icons/icon_boiler_4.svg"),
    iconBuble2(1, "assets/icons/icon_boiler_3.svg"),
    iconBuble2(2, "assets/icons/icon_boiler_2.svg"),
    iconBuble2(3, "assets/icons/icon_boiler_1.svg"),
    iconBuble2(4, "assets/icons/off.svg"),
    iconBuble2(5, "assets/icons/icon_boiler_7.svg"),
  ];


 static Widget iconBuble2(int dpas,iconRoute) {
          return GestureDetector(
            onTap: () {
             print("tap on iconBuble2");
            }, child: Container(
            width: 83,
            height: 83,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child:Align(
                      alignment: Alignment.center,
                      child: iconSvgD(iconRoute, Colors.white, 40)
                  ),
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(dpas.toString(),style: MyTextStyle.estiloBold(10, Colors.white),),
                    )
                )
              ],
            ),
          ),
      );
  }
//  final RadialListViewModel radialList;
  List<Widget> _radialListItems() {
    return radialNumbers.items.map((RadialListItemViewModel viewModel) {
      final listItem = _radialListItem(viewModel);
      return listItem;
    }).toList();
  }

  Widget _radialListItem(RadialListItemViewModel viewModel){
    return  ItemBoiler(
      listItem: viewModel,
    );
  }

  /*
  *    return radialList.items.map((RadialListItemViewModel viewModel){
      final listItem = _radialListItem(viewModel,currentAngle);
      currentAngle += angleDiff;
      return listItem;
    }).toList();
    *
    *
    *
    *
    *
  * */



}