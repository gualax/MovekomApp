import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/item_boiler_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ItemBoiler extends StatefulWidget {


  final RadialListItemViewModel listItem;
  //final VoidCallback onSelect;

  ItemBoiler({
    this.listItem,
    //this.onSelect
  });


  @override
  _ItemBoilerState createState() => _ItemBoilerState();
}

class _ItemBoilerState extends State<ItemBoiler> {
  ItemBoilerBloc itemBoilerBloc;
  BoilerBloc boilerBloc;

  @override
  Widget build(BuildContext context) {
    return iconBuble();
  }

  Widget iconBuble() {
    return
      BlocBuilder<ItemBoilerBloc,ItemBoilerState>(
       builder: ( context, state) {
         itemBoilerBloc = BlocProvider.of<ItemBoilerBloc>(context);
         boilerBloc = BlocProvider.of<BoilerBloc>(context);
       return GestureDetector(
              onTap: () {
            //    widget.onSelect;
                setState(() {
                  widget.listItem.isSelected = true;
                });
                boilerBloc.add(Update(widget.listItem.number.toDouble()));
                print("tapped number " + widget.listItem.number.toString() );
                //widgState = true;
                //itemBoilerBloc.add(EnableItemBoiler());
              },
             child: Container(
              width: 83,
              height: 83,
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child:Align(
                        alignment: Alignment.center,
                        child: iconSvgD(widget.listItem.iconRoute, widget.listItem.isSelected ? Colors.red : Colors.yellow, 40)
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(widget.listItem.number.toString(),style: MyTextStyle.estiloBold(10, Colors.white),),
                      )
                  )
                ],
              ),
            ),
            );
           }
      );
  }

}


class RadialListViewModel{
  final List<RadialListItemViewModel> items;

  RadialListViewModel({
    this.items = const [],
  });

}


class RadialListItemViewModel{
  int number;
  bool isSelected;
  String iconRoute;

  RadialListItemViewModel({
    this.isSelected=false,
    this.number,
    this.iconRoute,
  });

}

final RadialListViewModel radialNumbers = new RadialListViewModel(
    items: [
      new RadialListItemViewModel(
        number: 6,
        isSelected: true,
        iconRoute:"assets/icons/icon_boiler_6.svg",
      ),
      new RadialListItemViewModel(
        number: 7,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_5.svg",
      ),
      new RadialListItemViewModel(
        number: 0,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_4.svg",
      ),new RadialListItemViewModel(
        number: 1,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_3.svg",
      ),
      new RadialListItemViewModel(
        number: 2,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_2.svg",
      ),
      new RadialListItemViewModel(
        number: 3,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_1.svg",
      ),
      new RadialListItemViewModel(
        number: 4,
        isSelected: false,
        iconRoute:"assets/icons/off.svg",
      ),
      new RadialListItemViewModel(
        number: 5,
        isSelected: false,
        iconRoute:"assets/icons/icon_boiler_7.svg",
      )
    ]
);

/*

class RadialList extends StatefulWidget {

  final RadialListViewModel radialList;
  final double radius;

  RadialList({
    this.radialList,
    this.radius,
  });

  List<Widget> _radialListItems(){

    final double firstItemAngle = pi;
    final double lastItemAngle = pi;
    final double angleDiff = (firstItemAngle + lastItemAngle) / (radialList.items.length);

    double currentAngle = firstItemAngle;
    return radialList.items.map((RadialListItemViewModel viewModel){
      final listItem = _radialListItem(viewModel,currentAngle);
      currentAngle += angleDiff;
      return listItem;
    }).toList();
  }

  Widget _radialListItem(RadialListItemViewModel viewModel, double angle){
    return Transform(
      transform: new Matrix4.translationValues(
          180.0,
          250.0,
          0.0
      ),
      child: RadialPosition(
        radius: radius,
        angle: angle,
        child: new RadialListItem(
          listItem: viewModel,
        ),
      ),
    );
  }

  @override
  RadialListState createState() {
    return new RadialListState();
  }
}

class RadialListState extends State<RadialList> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: widget._radialListItems(),
    );
  }
}
*/

