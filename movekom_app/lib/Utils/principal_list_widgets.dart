
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'MyColors.dart';
import 'SC.dart';


class PWidgetList extends StatefulWidget implements Equatable {
  Widget widget;
  bool addBar;
  bool isAdded;
  double width;

  PWidgetList(this.widget);
  @override
  _PWidgetListState createState() => _PWidgetListState();

  @override
  // TODO: implement props
  List get props => throw UnimplementedError();
}

class _PWidgetListState extends State<PWidgetList> {

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: 240,
      height: 185,
      child: Stack(
        children: <Widget>[
         widget.widget,
        ],
      ),
    );
  }

  Widget add_bar() {
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: widget.width,
      height: 20,
      color: MyColors.baseColor,
      child: Center(
        child: Text("AÑADIR",
          style: MyTextStyle.estiloBold(13, MyColors.text),),
      ),
    );
  }

}
