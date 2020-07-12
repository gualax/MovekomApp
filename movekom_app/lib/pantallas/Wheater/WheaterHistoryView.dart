import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/clima_page_view_changer.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_ext.dart';
import 'package:movekomapp/controladores/climatizacion/temperature_int.dart';
import 'package:movekomapp/controladores/graficos/graficos.dart';
import 'package:movekomapp/pantallas/Wheater/weather_list.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class WheaterHistoryView extends StatefulWidget {
  @override
  _WheaterHistoryViewState createState() => _WheaterHistoryViewState();
}

class _WheaterHistoryViewState extends State<WheaterHistoryView> {

  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return contenido();
  }



  Widget contenido(){
    return Material(
      color:Colors.black,
      child: Container(
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            WeatherListWidget("Buenos Aires"),
                            electricityDatos(),
                          ],
                        ),
                        MyContainer(
                            child: MyPositioned.fill(
                              right: 50,top: 50,
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: closeButton()
                              ),
                            )
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
      ),
    );
  }

  List<Widget> _dayBoxesWidgets() {
    return dayBoxes.items.map((DayBox viewModel) {
      final listItem =
      GrphicDayItemBox(
        listItem: viewModel,
        index: viewModel.number,
        isSelected: currentSelectedIndex == viewModel.number,
        widgetType: 1,
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
  Widget electricityDatos() {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          daysAndHours(),
          temps(),
          graficos(),
        ],
      ),
    );
  }


  Widget daysAndHours(){
      return Material(
        color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _dayBoxesWidgets(),
      ),
    );
  }

  Widget days(title){
    return Material(
      color: Colors.black,
      child: MyContainer(
        margin: EdgeInsets.only(bottom: SC.bot(4),left:SC.left(4),top:SC.top(4), right: SC.right(7) ),
        width: 160,
        height: 63,
        decoration: BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Center(
          child: Text(title,
              style: MyTextStyle.estiloBold(18, MyColors.principal)),
        ),
      ),
    );
  }

  Widget graficos(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        graphic_image(dayBoxes.items[currentSelectedIndex].imageRoute),
        graphic_image(dayBoxes.items[currentSelectedIndex].imageRoute),
      ],
    );
  }

  Widget temps(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TemperatureInt(1),
        TemperatureExt(1),
      ],
    );
  }



  //////////////////////////////////////////////////////////////


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
    var data2 = [0.0, 1.2, 1.3, 1.4, 1.9, 1.6, 0.5, 0.3, 0.6, 0.8, 1.2];

    return MyContainer(
        margin: EdgeInsets.only(left: SC.left(7),top: SC.top(5),bottom: SC.bot(5)),
        width: 690,
        height: 130,
        decoration: new BoxDecoration(
            color: MyColors.baseColor
        ),
        child: Center(
          child: MyContainer(
            width: 690,
            height: 130,
            child: Stack(
              children: <Widget>[
                Sparkline(
                  data:data,
                  lineWidth: SC.all(2.0),
                  lineColor: Colors.green,
                  pointsMode: PointsMode.all,
                  pointSize: SC.all(8.0),
                  pointColor: Colors.lightGreenAccent,
                  //    fillMode: FillMode.below,
                  fillGradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green[900], Colors.lightGreen],
                  ),
                ),
                Sparkline(
                  data:data2,
                  lineWidth: SC.all(2.0),
                  lineColor: Colors.grey,
                  pointsMode: PointsMode.all,
                  pointSize: SC.all(8.0),
                  pointColor: Colors.lightGreenAccent,
                  //    fillMode: FillMode.below,
                  fillGradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green[900], Colors.lightGreen],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Widget closeButton(){
    return GestureDetector(
      onTap: (){
        ClimaPageChanger climaPageChanger =  ClimaPageChanger(context);
        climaPageChanger.changeTab(0);
      },
      child: MyContainer(
        height: 50,
        width: 50,
        child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 20),
      ),
    );
  }
}
