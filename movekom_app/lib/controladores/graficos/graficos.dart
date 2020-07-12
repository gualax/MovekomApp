import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class GrphicDayItemBox extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  final DayBox listItem;
  final int widgetType;

  GrphicDayItemBox({this.index,this.isSelected, this.onSelect, this.listItem,this.widgetType});
  @override
  _GrphicDayItemBoxState createState() => _GrphicDayItemBoxState();
}

class _GrphicDayItemBoxState extends State<GrphicDayItemBox> {
  @override
  Widget build(BuildContext context) {
    if(widget.widgetType == 1){
      return daysWheather();
    }  else {
      return daysElectricity();
    }
  }


  Widget daysElectricity(){
    return GestureDetector(
      onTap: widget.onSelect,
      child: MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 160,
        height: 71,
        decoration: BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Center(
          child: Text(widget.listItem.title,
              style: MyTextStyle.estiloBold(18, widget.isSelected ? MyColors.principal : MyColors.text)),
        ),
      ),
    );
  }

  Widget daysWheather(){
    return GestureDetector(
      onTap: widget.onSelect,
      child: Material(
        color: Colors.black,
        child: MyContainer(
          margin: EdgeInsets.only(bottom: SC.bot(4),left:SC.left(4),top:SC.top(4), right: SC.right(7) ),
          width: 160,
          height: 63,
          decoration: BoxDecoration(
              color: MyColors.baseColor
          ),
          child: Center(
            child: Text(widget.listItem.title,
                style: MyTextStyle.estiloBold(18,widget.isSelected ? MyColors.principal : MyColors.text)),
          ),
        ),
      ),
    );
  }


}








/// lista de items
class DayBoxes{
  final List<DayBox> items;
  DayBoxes({
    this.items = const [],
  });
}

/// item
class DayBox {
  int number;
  String imageRoute;
  bool selected;
  String title;
  DayBox({
    this.number,
    this.imageRoute,
    this.selected,
    this.title
  });
}

final DayBoxes dayBoxes = new DayBoxes(
    items: [
      new DayBox(
        number: 0,  //6
        imageRoute:"assets/images/graficos/grafico_24h.png",
        selected: true,
        title: "24 HORAS",
      ),
      new DayBox(
        number: 1,  //7
        imageRoute:"assets/images/graficos/grafico_7d.png",
        selected: false,
        title: "7 DIAS",

      ),
      new DayBox(
        number: 2, //0
        imageRoute:"assets/images/graficos/grafico_15d.png",
        selected: false,
        title: "15 DIAS",

      ),new DayBox(
          number: 3, //1
        imageRoute:"assets/images/graficos/grafico_30d.png",
          selected: false,
        title: "30 DIAS",

      )
    ]
);
