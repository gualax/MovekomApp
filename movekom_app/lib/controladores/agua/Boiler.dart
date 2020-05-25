import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/AnimatedBoiler.dart';
import 'package:movekomapp/controladores/agua/ItemBoiler.dart';


class Boiler extends StatefulWidget {


  @override
  _BoilerState createState() => _BoilerState();
}

class _BoilerState extends State<Boiler> {
int currentSelectedIndex;
BoilerBloc boilerBloc;
bool isFisrtRender = true;

  @override
  Widget build(BuildContext context) {
    return circularListBoiler();
  }

  Widget circularListBoiler() {
    AnimatedBoiler animatedBoiler = AnimatedBoiler();
    return
      BlocBuilder<BoilerBloc,BoilerState>(
          builder: ( context, state) {
            boilerBloc = BlocProvider.of<BoilerBloc>(context);
            print("valueCord boiler: " + state.valueCord.toString());
            return Container(
              child: CircleList(
                centerWidget: animatedBoiler,
                rotateMode: RotateMode.stopRotate,
                outerRadius: 210,
                innerRadius: 120,
                origin: Offset(0, 0),
                children:  _radialListItems(),
            ),
            );
          }
      );
  }


List<Widget> _radialListItems() {
  return radialNumbers.items.map((RadialListItemViewModel viewModel) {
    final listItem = ItemBoiler(
      firstTime: getInitial(),
      listItem: viewModel,
      index: viewModel.number,
      isSelected: currentSelectedIndex == viewModel.number,
      onSelect: () {
         boilerBloc.add(Update(viewModel.number.toDouble()));
        setState(() {
          isFisrtRender = false;
          currentSelectedIndex = viewModel.number;
        });
      },
    );
    return listItem;
  }).toList();
}

bool getInitial(){
  return isFisrtRender;
}

}
