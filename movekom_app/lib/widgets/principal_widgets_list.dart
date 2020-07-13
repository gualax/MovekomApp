import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/p_widget_list.dart';

import 'WWidgets.dart';


class PrincipalWidgetsList extends StatefulWidget {
  @override
  _PrincipalWidgetsListState createState() => _PrincipalWidgetsListState();
}

class _PrincipalWidgetsListState extends State<PrincipalWidgetsList> {
  @override
  void initState() {
    // TODO: implement initState
    print("PrincipalWidgetsList // initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("PrincipalWidgetsList // build");
    return
      StreamBuilder(
        stream: bloc.getCarrouselStream,
        initialData: bloc.carrouselList,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? horizontalList(snapshot)
              : Center(child: Text("You haven't taken any item yet"));
        },
      );
  }


  Widget horizontalList(snapshot){
    return Container(
      alignment: Alignment.center,
      height: SC.hei(150),
      margin: EdgeInsets.only(left: SC.left(40),top: SC.top(20),right:SC.left(40) ),
      child:
      ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, i) {
              final List<Widget> widList = snapshot.data;
              return GestureDetector(
                onTap: (){
                //       bloc.removeFromCarrousel(widList[i]);
                },
                child: widList[i],
              );
            },
          ),
    );
  }

}
