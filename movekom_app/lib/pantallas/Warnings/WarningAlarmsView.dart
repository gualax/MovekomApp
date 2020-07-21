import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/warning_blocs/warning_list_bloc.dart';
import 'package:movekomapp/controladores/averias/averias.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WarningAlarmsView extends StatefulWidget {
  @override
  _WarningAlarmsViewState createState() => _WarningAlarmsViewState();
}

class _WarningAlarmsViewState extends State<WarningAlarmsView> {
  @override
  Widget build(BuildContext context) {
    return AlertRowList();
  }

  Widget alertas() {
    return Container(
      child: ListView(
        children: <Widget>[
          Averia(),
          Averia(),
          Averia(),
          Averia(),
          Averia(),
          Averia(),
          Averia(),
        ],
      ),
    );
  }
}

class AlertRowList extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.warningList,
      stream: bloc.getWarninfListStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? warningWidgetListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }

  Widget warningWidgetListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, i) {
        final List<Averia> averia = snapshot.data;
        return MyContainer(
          margin: EdgeInsets.all(SC.all(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              averia[i],
              criticBox(),
              deleteBox(averia[i]),
            ],
          ),
        );

        // return widList[i];
        //          //  snapshot.data.map<Widget>((item) => Averia()).toList(),
      },
    );
  }

  Widget deleteBox(Averia widList) {
    return InkWell(
      splashColor: MyColors.inkSplashColor,
      onTap: () {
        bloc.remove(widList);
      },
      child: MyContainer(
        height: 100,
        width: 100,
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("BORRA",
                    style: MyTextStyle.estiloBold(18, MyColors.text)),
              ),
            ),
            MyPositioned.fill(
              top: 25,
              child: Align(
                alignment: Alignment.center,
                child: iconSvgD("assets/icons/eraser.svg", MyColors.text, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget criticBox() {
    return MyContainer(
      height: 100,
      width: 100,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("CRITIC",
                  style: MyTextStyle.estiloBold(18, MyColors.text)),
            ),
          ),
          MyPositioned.fill(
            top: 25,
            child: Align(
              alignment: Alignment.center,
              child:
                  Text("SI", style: MyTextStyle.estiloBold(18, MyColors.text)),
            ),
          ),
        ],
      ),
    );
  }
}
