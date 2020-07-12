import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/controladores/graficos/graficos.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class ElectricityGraphicsView extends StatefulWidget {
  @override
  _ElectricityGraphicsViewState createState() => _ElectricityGraphicsViewState();
}

class _ElectricityGraphicsViewState extends State<ElectricityGraphicsView> {
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: electricityDatos(),
    );
  }


  Widget electricityDatos() {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          daysAndHours(),
          voltaje_totalizador(),
          graficos(),
        ],
      ),
    );
  }


  Widget daysAndHours(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _dayBoxesWidgets(),
    );
  }

  List<Widget> _dayBoxesWidgets() {
    print("REARMO?");
    return dayBoxes.items.map((DayBox viewModel) {
      final listItem =
      GrphicDayItemBox(
        listItem: viewModel,
        index: viewModel.number,
        isSelected: currentSelectedIndex == viewModel.number,
        widgetType: 2,
        onSelect: () {
          setState(() {
            currentSelectedIndex = viewModel.number;
            print(currentSelectedIndex);
          });
        },
      );
      return listItem;
    }).toList();
  }

  Widget days(title){
    return MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 160,
        height: 71,
        decoration: BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Center(
        child: Text(title,
          style: MyTextStyle.estiloBold(18, MyColors.principal)),
    ),
    );
  }

  Widget graficos(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        graphic_image(dayBoxes.items[currentSelectedIndex].imageRoute),
        graphic_image(dayBoxes.items[currentSelectedIndex].imageRoute),
      ],
    );
  }

  Widget voltaje_totalizador(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        voltaje(),
        totalizador(),
      ],
    );
  }

  Widget voltaje(){
    return MyContainer(
        margin: EdgeInsets.all(SC.all(7)),
        width: 160,
        height: 159,
        decoration: BoxDecoration(
            color: MyColors.baseColor
        ),
      child: Stack (
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("VOLTAJE DE BATERIA AUXILIAR",
                style: MyTextStyle.estilo(14, MyColors.text),
                  textAlign: TextAlign.center),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.center,
              child: Text("MAXIMA",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            top:15,
            child: Align(
              alignment: Alignment.center,
              child: Text("14.8 V",
                style: MyTextStyle.estilo(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom:35 ,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("MINIMA",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("11.3 V",
                style: MyTextStyle.estilo(14, MyColors.text),),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalizador(){
    return MyContainer(
      margin: EdgeInsets.all(SC.all(7)),
      width: 160,
      height: 159,
      decoration: BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Stack (
        children: <Widget>[
          MyPositioned.fill(
            top:10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("TOTALIZADOR DE CORRIENTE",
                  style: MyTextStyle.estilo(14, MyColors.text),
                  textAlign: TextAlign.center),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.center,
              child: Text("MAXIMA",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            top:15,
            child: Align(
              alignment: Alignment.center,
              child: Text("+50 A",
                style: MyTextStyle.estilo(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom:35 ,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("MINIMA",
                style: MyTextStyle.estiloBold(14, MyColors.text),),
            ),
          ),
          MyPositioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("-36 A",
                style: MyTextStyle.estilo(14, MyColors.text),),
            ),
          ),
        ],
      ),
    );
  }

  Widget box420() {
    return Container(
      margin: EdgeInsets.all(5),
      width: 420,
      height: 174,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
    );
  }


  Widget graphic_image(imageRoute){
    return MyContainer(
        margin: EdgeInsets.all( SC.left(7)),
        width: 699,
        height: 160,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageRoute),
          fit: BoxFit.fill,
        ),
      ),
    );
  }


  Widget graphic(){
    var data = [0.0, 1.0, 1.5, 1.8, 0.9, 0.6, 0.2, 0.3, 0.4, 0.8, 1.0];
    return MyContainer(
      margin: EdgeInsets.all( SC.left(7)),
      width: 699,
      height: 160,
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Center(
        child: MyContainer(
          width: 690,
          height: 150,
          child: Sparkline(
            data:data,
            lineWidth: SC.all(2),
            lineColor: Colors.white,
            pointsMode: PointsMode.all,
            pointSize: SC.all(8),
            pointColor: Colors.lightGreenAccent,
           // fillMode: FillMode.below,
            fillGradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green[900], Colors.lightGreen],
            ),
          ),
        ),
      ),
    );
  }


}
