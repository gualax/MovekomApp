
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/Utils/numbers_list.dart';
import 'package:movekomapp/Utils/radial_list.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

import 'package:circle_list/circle_list.dart';

class WaterBoilerView extends StatefulWidget {
  RadialListViewModel radialNumbers;
  WaterBoilerView({
    @required this.radialNumbers
  });
  @override
  _WaterBoilerViewState createState() => _WaterBoilerViewState();
}

class _WaterBoilerViewState extends State<WaterBoilerView> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return boilerBox();
  }

  Widget boilerBox() {
    return Container(
      alignment: Alignment.center,
      width: 900,
      height: 474,
      decoration: new BoxDecoration(
          color: Color(0xff1c1c1c)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              top: 20,
              left: 30,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "BOILER", style: MyTextStyle.estiloBold(30, Colors.white),),
              )
          ),
          Positioned.fill(
              left: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/fire.svg", Colors.lightGreenAccent, 200),
              )
          ),
          Positioned.fill(
              left: 160,
              bottom: 200,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD(
                    "assets/icons/gota_agua.svg", Colors.lightGreenAccent, 100),
              )
          ),
          Positioned.fill(
              right: 160,
              bottom: 100,
              child: Align(
                alignment: Alignment.center,
                child: Text("21",
                  style: MyTextStyle.estiloBold(150, Colors.white),),
              )
          ),
          Positioned.fill(
              right: 220,
              bottom: 260,
              child: Align(
                alignment: Alignment.center,
                child: Text("Temperatura,",
                  style: MyTextStyle.estilo(25, Colors.white),),
              )
          ),
          Positioned.fill(
            right: 125,
              child: Align(
                alignment: Alignment.centerRight,
                child: exported(230.0),
              )
          ),
          Positioned.fill(
              right: 120,
              child: Align(
                alignment: Alignment.centerRight,
                child: circularListPunto(100.0),
              )
          ),
          Positioned.fill(
              right: 20,
              child: Align(
                alignment: Alignment.centerRight,
                child: circularList(),
              )
          ),
        ],

      ),
    );
  }


  Widget radialNum(){
    return Container(
        child: Stack(
          children: <Widget>[
            RadialList(
              radialList: radialNumbers,
              radius: 150.00,
            ),
          ],
        )
    );
  }

  Widget circulito(size, color) {
    //this is base circle
    return Container(
      child: CustomPaint(
          painter: DrawCircle(size, color, PaintingStyle.stroke, 3.0)),
    );
  }

  Widget exported(dim) {
    return Container(
        width: dim,
        height: dim,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff474747),
          boxShadow: [BoxShadow(
              color: Color(0xff94e538),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0
          )
          ],
        ),
    );
  }

//https://pub.dev/packages/flutter_circular_slider#-readme-tab-
  Widget circularSlider() {
    return
      SingleCircularSlider(
        288,
        10,
        height: 320,
        width: 320,
        primarySectors: 6,
        secondarySectors: 24,
        //  baseColor: MyColors.ContainerColor,
        // selectionColor: Colors.lightGreenAccent,
     //   handlerColor: Colors.lightGreenAccent,
        handlerOutterRadius: 1,
        onSelectionChange: _updateLabels,
        onSelectionEnd: (a, b, c) => print('onSelectionEnd $a $b $c'),
        sliderStrokeWidth: 40.0,

        showRoundedCapInSelection: false,
        showHandlerOutter: true,
        child: Padding(
            padding: const EdgeInsets.all(42.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text('',
                    style: TextStyle(fontSize: 36.0, color: Colors.white)),
                Text('',
                    style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ],
            )),
        shouldCountLaps: true,
      );
  }

  void _updateLabels(int init, int end, int laps) {
    setState(() {
      // inBedTime = init;
      //outBedTime = end;
      // days = laps;
    });
  }

//https://flutterawesome.com/a-new-flutter-package-for-circle-list/
  Widget circularList() {
    PolarCoord _lastCord;
    return Container(
      child: CircleList(
      //  innerCircleColor: Colors.redAccent,
        //outerCircleColor: Colors.greenAccent,

        outerRadius: 220,
        innerRadius: 120,
        origin: Offset(0, 0),
        children: List.generate(8, (index) {
          return iconBuble(index);
        }),
        onDragUpdate: (PolarCoord updateCoord) {
          print("updated cord" + updateCoord.toString());
          _lastCord = updateCoord;
        },
        onDragEnd: () {
          print("terminio?");
          print("last?" + _lastCord.toString());
        },
      ),
    );
  }

  Widget manija(int dpas) {
    return Container(
        width: 20,
        height: 20,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreenAccent,
          boxShadow: [BoxShadow(
              color: Color(0xff94e538),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0
          )
          ],

        )
    );
  }
//https://pub.dev/packages/circle_wheel_scroll


Widget otherCircleWidget(){
    return Container(
      child: CircleListScrollView(
        physics: CircleFixedExtentScrollPhysics(),
        axis: Axis.horizontal,
        itemExtent: 100,
        children: List.generate(20, manija),
        radius: 100,
      ),
    );
}


  Widget iconBuble(int dpas) {
    return Container(
        width: 83,
        height: 83,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: MyColors.ContainerColor,
          ),
            child: iconSvgD("assets/icons/fire.svg", Colors.white, 40),
        );
  }


  Widget circuloImage(dim) {
    return Container(
        width: dim,
        height: dim,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
     //     color: Color(0xff474747),
          image: DecorationImage(
            image: AssetImage("assets/images/circulo_boiler.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 3,
                    width: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.white,
                  ),
              )
          )
        ],
    ),
    );
  }


  Widget circularListPunto(dim) {
    PolarCoord _lastCord;
    return Container(
      child: CircleList(
        //  innerCircleColor: Colors.redAccent,
        //outerCircleColor: Colors.greenAccent,
        outerRadius: dim * 1.2,
        innerRadius: dim,
        origin: Offset(0, 0),
        children: List.generate(8, (index) {
          return manija(index);
        }),
        onDragUpdate: (PolarCoord updateCoord) {
          print("updated cord" + updateCoord.toString());
          _lastCord = updateCoord;
        },
        onDragEnd: () {
          print(" ***  terminio *** ");
          print("_lastCord: " + _lastCord.toString());
          print("radius: " + _lastCord.radius.toString());
          print("angle: " + _lastCord.getAngleRad().toString());
        },
      ),
    );
  }

}


