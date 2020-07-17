import 'package:circle_list/circle_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/radial_postion.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';
import 'dart:math';

class CalefaccionNew extends StatefulWidget {
  int widgetType;

  CalefaccionNew(this.widgetType);

  @override
  _CalefaccionNewState createState() => _CalefaccionNewState();
}

class _CalefaccionNewState extends State<CalefaccionNew> {
  final String title = "CALEFACCION";
  bool isFisrtRender = true;
  CalefaccionBloc calefaccionBloc;
  double angleDelta;
  double deltaY;
  double deltaX;

  @override
  void initState() {
    angleDelta = 180; //-90 //start from top position
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SC().init(context);
    calefaccionBloc = BlocProvider.of<CalefaccionBloc>(context);
    return calefContainer();
  }

  Widget calefContainer() {
    Color colorText, colorIcon, colorButton;
    String text_on_off;
    return BlocBuilder<CalefaccionBloc, CalefaccionState>(
        builder: (context, state) {
      if (state.isEnabled) {
        colorText = MyColors.text;
        colorButton = MyColors.principal;
        colorIcon = MyColors.principal;
        text_on_off = "Pulse para apagar";
      } else {
        colorText = MyColors.inactive;
        colorButton = MyColors.text;
        colorIcon = MyColors.inactive;
        text_on_off = "Pulse para encender";
      }
      return MyContainer(
        margin: EdgeInsets.only(
            top: SC.top(6),
            bottom: SC.bot(6),
            left: SC.left(10),
            right: SC.right(10)),
        width: 500,
        height: 410,
        decoration: new BoxDecoration(color: MyColors.baseColor),
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            MyPositioned(
              left: 370, bottom: 20, //270 //13
              child: Align(
                alignment: Alignment.center,
                child: calefa_img(360.0),
              ),
            ),
            MyPositioned.fill(
                left: 40,
                top: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: MyTextStyle.estiloBold(25, colorText),
                  ),
                )),
            MyPositioned.fill(
                bottom: 120,
                right: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Temperature ºC",
                    style: MyTextStyle.estiloBold(18, colorText),
                  ),
                )),
            MyPositioned.fill(
              left: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/fire.svg", colorIcon, 130),
              ),
            ),
            MyPositioned.fill(
                left: 5,
                bottom: 30,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    text_on_off,
                    style: MyTextStyle.estiloBold(20, colorText),
                  ),
                )),
            MyPositioned.fill(
                right: 210,
                bottom: 33,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: iconSvgD("assets/icons/on_off.svg", colorIcon, 25),
                )),
            MyPositioned.fill(
              top: 15,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: circuloConSombra(20.0, colorIcon),
              ),
            ),
            MyPositioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(state.isEnabled ? state.valueTemp.toString() : "--",
                    style: MyTextStyle.estiloBold(100, colorText),),
                )
            ),
            MyPositioned.fill(
              left: 300,
              child: Align(
                alignment: Alignment.center,
                child: state.isEnabled ? GestureDetector(
                  onVerticalDragUpdate: _onVerticalDragUpdate,
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  child: MyContainer(
                    height: 410,
                      width: 190,
                    color: Colors.transparent,
                  ),
                ) : null
              ),
            ),
            MyPositioned.fill(
              bottom: 10,
              right: 30,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "15ºC",
                  style: MyTextStyle.estiloBold(20, MyColors.text),
                ),
              ),
            ),
            MyPositioned.fill(
              top: 10,
              right: 30,
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "35ºC",
                  style: MyTextStyle.estiloBold(20, MyColors.text),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: MyContainer(
                width: 280,
                height: 400,
                    color: Colors.transparent,
                child: GestureDetector(
                  onTap: (){
                    if(state.isEnabled){
                      print("CALEFACCCION!!!!!");
                      calefaccionBloc.add(DisableCalefaccion());
                    }else{
                      print("CALEFACCCION!!!!!");
                      calefaccionBloc.add(EnableCalefaccion());
                    }
                  },
                ),
              ),
            ),
            Transform.translate(
              offset:  Offset(SC.x(60.0), 5.0),
              child: RadialPosition(
                radius: SC.all(150), //150
                angle: angleToRad(angleDelta),
                child: state.isEnabled ?  GestureDetector(
                  //  onPanUpdate: _onPanUpdate,
                  onVerticalDragUpdate: _onVerticalDragUpdate,
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  child: MyContainer(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: flechaIndicador(angleToRad(angleDelta), 70.0)),
                  ),
                ) :
                MyContainer(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: flechaIndicador(angleToRad(angleDelta), 70.0)),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

//flechaIndicador(angleToRad(angleDelta),70.0))

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    //  print("*** Vertical dx : " + details.delta.dx.toString());
    print("*** Vertical dy : " + details.delta.dy.toString());
    deltaY = details.delta.dy;
    deltaX = details.delta.dx;
    if (angleDelta >= 114 && angleDelta <= 240) {
      angleDelta = angleDelta - ((details.delta.dy).roundToDouble() / 2);
    } else if (angleDelta < 114) {
      angleDelta = 115;
    } else if (angleDelta > 240) {
      angleDelta = 239;
    }
    calefaccionBloc.add(UpdateCalefaccionTemp(simulateTemp(angleDelta)));
    setState(() {});
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    print("*** Horizontal dx : " + details.delta.dx.toString());
    print("*** Horizontal dy : " + details.delta.dy.toString());
    if (angleDelta >= 114 && angleDelta <= 240) {
      angleDelta = angleDelta + ((details.delta.dx).roundToDouble() / 2);
    } else if (angleDelta < 114) {
      angleDelta = 115;
    } else if (angleDelta > 240) {
      angleDelta = 239;
    }
    calefaccionBloc.add(UpdateCalefaccionTemp(simulateTemp(angleDelta)));
    setState(() {});
  }

  double angleToRad(angle) {
    double converted = angle * pi / 180.0;
    print("converted: " + converted.toString());
    if (converted > ((pi / 2) + 0.5) && converted < ((pi * 1.5) - 0.5)) {
      return converted;
    } else if (converted <= ((pi / 2) + 0.5)) {
      return (pi / 2) + 0.5;
    } else {
      return ((pi * 1.5) - 0.5);
    }
  }


  int simulateTemp(double val) {
    if (val <= 116) {
      return (val * 1.3 / 10).round(); //1.388/
    }
    if (val >= 239) {
      return (val * 1.45 / 10).round(); //1.388/
    } else {
      return (val * 1.4 / 10).round(); //1.388
    }
  }

  Widget calefa_img(dim) {
    return MyContainer(
        height: dim,
        width: dim,
        //margin: EdgeInsets.all(dim),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/calefaccion10.png"),
            fit: BoxFit.contain,
          ),
        ));
  }

/*
  ClipRect(
  child: MyRadialPosition(
  radius: SC.all(150), //150
  angle: angleToRad(angleDelta),
  child: new GestureDetector(
  //  onPanUpdate: _onPanUpdate,
  onVerticalDragUpdate: _onVerticalDragUpdate,
  onHorizontalDragUpdate: _onHorizontalDragUpdate,
  child: MyContainer(
  child:Stack(
  children: <Widget>[
  MyPositioned.fill(
  child: Align(
  alignment: Alignment.center,
  child: flechaIndicador(angleToRad(angleDelta),70.0)),
  ),
  ],
  ),
  )),
  ),
  ),

 */

}
