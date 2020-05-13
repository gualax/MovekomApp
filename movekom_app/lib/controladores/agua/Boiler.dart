import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/controladores/agua/item_boiler.dart';

import 'AnimatedBoiler.dart';
//https://stackoverflow.com/questions/56113174/how-to-deselect-the-already-selected-item-after-tap-on-another-item-listview-in
class Boiler extends StatefulWidget {
  final RadialListViewModel radialList;

  Boiler({
    this.radialList,
  });

  List<Widget> _radialListItems() {
    return radialList.items.map((RadialListItemViewModel viewModel) {
      final listItem = _radialListItem(viewModel);
      return listItem;
    }).toList();
  }

  Widget _radialListItem(RadialListItemViewModel viewModel){
    return  ItemBoiler(
      listItem: viewModel,
    );
  }

  @override
  _BoilerState createState() => _BoilerState();
}

class _BoilerState extends State<Boiler> {

  @override
  Widget build(BuildContext context) {
    return circularListBoiler();
  }


  Widget circularListBoiler() {
    AnimatedBoiler animatedBoiler = AnimatedBoiler();
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
                children: widget._radialListItems(),
              ),
            );
          }
      );
  }

}
