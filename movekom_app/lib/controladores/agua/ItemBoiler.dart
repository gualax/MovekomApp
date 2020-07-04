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
import 'package:movekomapp/widgets/barra_add_ww.dart';

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
  String title  = "BOILER";
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
      if(widget.listItem.valueTemp == 0 ){
        textoIcon = "";
      }else{
        textoIcon = widget.listItem.valueTemp.toString();
      }
    return GestureDetector(
      onTap: widget.onSelect,
      child: MyContainer(
          width: 120,
          height: 120,
          alignment: Alignment.center,
          //color: Colors.blue,
          child: Stack(
            children: <Widget>[
              iconAligned(widget.listItem.number,widget.listItem.iconRoute,_selected),
              textAligned(widget.listItem.number),
            ],
        ),
      ),
    );
    }
    );
  }



}



Widget iconAligned(int number, iconRoute, selected){
  switch(number){
    case 0:
      return
        MyPositioned.fill(
          bottom: 35,
          child:Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 30)
          ),
        );
      break;
    case 1:
      return
        MyPositioned.fill(
          child:Align(
              alignment: Alignment.center,
              child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 35)
          ),
        );
      break;
    case 2:
      return
        MyPositioned.fill(
          right: 30,
        child:Align(
            alignment: Alignment.center,
            child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 35)
        ),
      );
      break;
    case 3:
      return
        MyPositioned.fill(
          top: 25,
        child:Align(
            alignment: Alignment.center,
            child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 30)
        ),
      );
      break;
    case 4:
      return
        MyPositioned.fill(
          left: 30,
        child:Align(
            alignment: Alignment.center,
            child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 35)
        ),
      );
      break;
    case 5:
    return
      MyPositioned.fill(
        child:Align(
            alignment: Alignment.center,
            child: iconSvgD(iconRoute, selected ? MyColors.principal : MyColors.text, 35)
        ),
      );
      break;
  }
}


Widget textAligned(int number){
  switch(number){
    case 0:
      return
        MyPositioned.fill(
          top: 20,
          child: Align(
          alignment: Alignment.center,
          child: Text("ELECTRICO",style: MyTextStyle.estiloBold(15, MyColors.text),
              textAlign: TextAlign.center),
        ));
      break;
    case 1:
      return
        MyPositioned.fill(
          left: 10, right: 10,
           child: Align(
            alignment: Alignment.bottomCenter,
              child: Text("FROST CONTROL",style: MyTextStyle.estiloBold(15, MyColors.text),
                  textAlign: TextAlign.center,
              ),
          ));
      break;
    case 2:
      return
        MyPositioned.fill(
          right: 15,
          child: Align(
          alignment: Alignment.centerRight,
          child: Text("40º",style: MyTextStyle.estiloBold(25, MyColors.text),
              textAlign: TextAlign.center),
      ),
        );
      break;
    case 3:
      return Align(
        child: Text(""),
      );
      break;
    case 4:
      return MyPositioned.fill(
        left: 20,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("70º",style: MyTextStyle.estiloBold(25, MyColors.text),
              textAlign: TextAlign.center),
        ),
      );
      break;
    case 5:
      return
        MyPositioned.fill(
          bottom: 10,
         child:Align(
         alignment: Alignment.bottomCenter,
         child: Text("DRENAJE",style: MyTextStyle.estiloBold(15, MyColors.text),
            textAlign: TextAlign.center),
      ));
      break;
  }

}



class widgetBoiler extends StatelessWidget {
  RadialListItemViewModel itemBoiler;
  String title = "BOILER";
  int widgetType;
  widgetBoiler(this.widgetType);

  @override
  Widget build(BuildContext context) {
    if(widgetType == 1){
      return widget_boiler();
    } else {
      return boiler_ww_white();
    }
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
                  title,
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
                child: iconSvgD(itemBoiler.iconRoute, MyColors.principal, 30),
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



  Widget boiler_ww_white(){
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
            return  MyContainer(
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
                          title,
                          style: MyTextStyle.estiloBold(18, MyColors.text),
                        ),
                      ),
                    ),
                    MyPositioned.fill(/// circulito
                        top: 10, right: 10,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: circuloConSombra(17.0, MyColors.white),
                        )
                    ),
                    MyPositioned.fill(    ///textAbajoIzq
                      left: 8,
                      bottom: 6,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "ON",
                          style: MyTextStyle.estilo(18, MyColors.text),
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
                        child: iconSvgD(itemBoiler.iconRoute, MyColors.white, 30),
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
                    ),
                  ])
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
        number: 0,  //6
        iconRoute:"assets/icons/enchufe_boiler.svg",
        selected: false,
        valueTemp:70,
      ),
      new RadialListItemViewModel(
        number: 1,  //7
        iconRoute:"assets/icons/icon_boiler_4.svg",
        selected: false,
        valueTemp:70,
      ),
      new RadialListItemViewModel(
        number: 2, //0
        iconRoute:"assets/icons/fire_boiler.svg",
        selected: false,
        valueTemp: 0,
      ),new RadialListItemViewModel(
        number: 3, //1
        iconRoute:"assets/icons/off.svg",
        selected: true,
        valueTemp:0
      ),
      new RadialListItemViewModel(
        number: 4,   //2
        iconRoute:"assets/icons/fire_boiler.svg",
        selected: false,
        valueTemp:40,
      ),
      new RadialListItemViewModel(
        number: 5,  // 3
        iconRoute:"assets/icons/valvula.svg",
        selected: false,
        valueTemp: 40,
      ),
    ]
);
