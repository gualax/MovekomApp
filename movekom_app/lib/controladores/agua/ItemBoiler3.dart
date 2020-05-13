import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/item_boiler_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ItemBoiler3 extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  final RadialListItemViewModel listItem;

  const ItemBoiler3({
    Key key,
    this.listItem,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _ItemBoiler3State createState() => _ItemBoiler3State();
}

class _ItemBoiler3State extends State<ItemBoiler3> {
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
      onTap: widget.onSelect,
      child: Container(
        width: 83,
        height: 83,
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child:Align(
                  alignment: Alignment.center,
                  child: iconSvgD(widget.listItem.iconRoute, widget.isSelected ? Colors.lightGreenAccent : Colors.white, 40)
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
  String iconRoute;
  bool selected;

  RadialListItemViewModel({
    this.number,
    this.iconRoute,
    this.selected,
  });

}

final RadialListViewModel radialNumbersB3 = new RadialListViewModel(
    items: [
      new RadialListItemViewModel(
        number: 6,
        iconRoute:"assets/icons/icon_boiler_6.svg",
        selected: false,
      ),
      new RadialListItemViewModel(
        number: 7,
        iconRoute:"assets/icons/icon_boiler_5.svg",
        selected: false,
      ),
      new RadialListItemViewModel(
        number: 0,
        iconRoute:"assets/icons/icon_boiler_4.svg",
        selected: false,
      ),new RadialListItemViewModel(
        number: 1,
        iconRoute:"assets/icons/icon_boiler_3.svg",
        selected: true,
      ),
      new RadialListItemViewModel(
        number: 2,
        iconRoute:"assets/icons/icon_boiler_2.svg",
        selected: false,
      ),
      new RadialListItemViewModel(
        number: 3,
        iconRoute:"assets/icons/icon_boiler_1.svg",
        selected: false,
      ),
      new RadialListItemViewModel(
        number: 4,
        iconRoute:"assets/icons/off.svg",
        selected: false,
      ),
      new RadialListItemViewModel(
        number: 5,
        iconRoute:"assets/icons/icon_boiler_7.svg",
        selected: false,
      )
    ]
);
