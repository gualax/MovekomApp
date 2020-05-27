import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class ItemBoiler extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  final bool firstTime;
  final RadialListItemViewModel listItem;

  const ItemBoiler({
    Key key,
    this.listItem,
    this.firstTime,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _ItemBoilerState createState() => _ItemBoilerState();
}

class _ItemBoilerState extends State<ItemBoiler> {
  BoilerBloc boilerBloc;
  bool _selected;
  @override
  Widget build(BuildContext context) {
    return iconBuble();
  }

  Widget iconBuble() {
    String textoIcon;
    return
       BlocBuilder<BoilerBloc,BoilerState>(
        builder: ( context, state) {
      if(state.valueCord.round() == widget.listItem.number){
        _selected = true;
      }else{
        _selected = false;
      }
      if(widget.listItem.number == 0 || widget.listItem.number == 4 ){
        textoIcon = "";
      }else{
        textoIcon = widget.listItem.valueTemp.toString();
      }
    return GestureDetector(
      onTap: widget.onSelect,
      child: MyContainer(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              child:Align(
                  alignment: Alignment.center,
                  child: iconSvgD(widget.listItem.iconRoute, _selected ? MyColors.principal : MyColors.text, 35)
              ),
            ),
            MyPositioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(widget.listItem.number.toString(),style: MyTextStyle.estiloBold(10, MyColors.text),),
                )
            ),
            MyPositioned.fill(
              top: 40,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(textoIcon,style: MyTextStyle.estiloBold(25, MyColors.text),
                  textAlign: TextAlign.center),
                )
            ),
          ],
        ),
      ),
    );
    }
    );
  }


  Widget boiler_item_widget() {
    String textoIcon;
    return
      BlocBuilder<BoilerBloc,BoilerState>(
          builder: ( context, state) {
            if(state.valueCord.round() == widget.listItem.number){
              _selected = true;
            }else{
              _selected = false;
            }
            if(widget.listItem.number == 0 || widget.listItem.number == 4 ){
              textoIcon = "";
            }else{
              textoIcon = widget.listItem.valueTemp.toString();
            }
        return GestureDetector(
         onTap: widget.onSelect,
         child: MyContainer(
          width: 100,
          height: 100,
        alignment: Alignment.center,
        child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            child:Align(
                alignment: Alignment.center,
                child: iconSvgD(widget.listItem.iconRoute, _selected ? MyColors.principal : MyColors.text, 40)
            ),
          ),
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(widget.listItem.number.toString(),style: MyTextStyle.estiloBold(10, MyColors.text),),
              )
          ),
          MyPositioned.fill(
              top: 40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(textoIcon,style: MyTextStyle.estiloBold(25, MyColors.text),
                    textAlign: TextAlign.center),
              )
          ),
        ],
      ),
    ),
    );
  }
  );
  }

}



class widgetBoiler extends StatelessWidget {
  RadialListItemViewModel itemBoiler;
  @override
  Widget build(BuildContext context) {
    return widget_boiler();
  }


  Widget widget_boiler(){
    int index;
    return
    BlocBuilder<BoilerBloc,BoilerState>(
    builder: ( context, state) {
      index = state.valueCord.round();
      print(radialNumbers.items[index].valueTemp.toString());
      radialNumbers.items.forEach((item){
       if( item.number == index){
         print(index);
         itemBoiler = item;
       }
      });
      return  ClipRect(
      child: MyContainer(
          margin: EdgeInsets.all(SC.all(7)),
          width: 225,
          height: 140,
          decoration: BoxDecoration(
              color: MyColors.baseColor
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            MyPositioned.fill(  ///titulo
              top: 4,
              left: 8,
              child:   Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Boiler",
                  style: MyTextStyle.estiloBold(18, MyColors.text),
                ),
              ),
            ),
            MyPositioned.fill(/// circulito
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(17.0, MyColors.principal),
                )
            ),
            MyPositioned.fill(    ///textAbajoIzq
              left: 8,
              bottom: 6,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "ON",
                  style: MyTextStyle.estilo(18, MyColors.principal),
                ),
              ),
            ),
            MyPositioned.fill(  ///textAbajoDer
              right: 8,
              bottom: 6,
              child:  Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Consumo " + "2.65" + "A",
                  style: MyTextStyle.estilo(18, MyColors.text),
                ),
              ),
            ),
            MyPositioned.fill(  ///icon
              left: 25,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(itemBoiler.iconRoute, MyColors.principal, 50),
              ),
            ),
            MyPositioned.fill(  ///textValue
              right: 30,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  itemBoiler.valueTemp.toString(),
                  style: MyTextStyle.estiloBold(45, MyColors.text),
                ),
              ),
            )
          ])
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
  int valueTemp;

  RadialListItemViewModel({
    this.number,
    this.iconRoute,
    this.selected,
    this.valueTemp,
  });

}

final RadialListViewModel radialNumbers = new RadialListViewModel(
    items: [
      new RadialListItemViewModel(
        number: 6,  //6
        iconRoute:"assets/icons/icon_boiler_6.svg",
        selected: false,
        valueTemp:70,
      ),
      new RadialListItemViewModel(
        number: 7,  //7
        iconRoute:"assets/icons/icon_boiler_5.svg",
        selected: false,
        valueTemp:70,
      ),
      new RadialListItemViewModel(
        number: 0, //0
        iconRoute:"assets/icons/icon_boiler_4.svg",
        selected: false,
        valueTemp: 0,
      ),new RadialListItemViewModel(
        number: 1, //1
        iconRoute:"assets/icons/icon_boiler_3.svg",
        selected: true,
        valueTemp:70
      ),
      new RadialListItemViewModel(
        number: 2,   //2
        iconRoute:"assets/icons/icon_boiler_2.svg",
        selected: false,
        valueTemp:40,
      ),
      new RadialListItemViewModel(
        number: 3,  // 3
        iconRoute:"assets/icons/icon_boiler_1.svg",
        selected: false,
        valueTemp: 40,
      ),
      new RadialListItemViewModel(
        number: 4,  //4
        iconRoute:"assets/icons/off.svg",
        selected: false,
        valueTemp:0,
      ),
      new RadialListItemViewModel(
        number: 5, //5
        iconRoute:"assets/icons/icon_boiler_7.svg",
        selected: false,
        valueTemp:70,
      )
    ]
);
