
import 'package:circle_list/circle_list.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/DrawCircle.dart';
import 'package:movekomapp/blocs/calefaccion_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class Calefaccion extends StatelessWidget {
  int widgetType;
  final String title = "Calefaccion";

  Calefaccion(this.widgetType);



  @override
  Widget build(BuildContext context) {
    final calefaccionBloc = BlocProvider.of<CalefaccionBloc>(context);
    if (widgetType == 1) {
      return calefaccion_big(calefaccionBloc);
    } else {
      return calefaccion_big(calefaccionBloc);
    }
  }

  Widget calefaccion_big(calefaccionBloc) {
    Color colorText, colorIcon, colorButton;
    String text_on_off;
  return
    BlocBuilder<CalefaccionBloc,CalefaccionState>(
        builder: ( context, state) {
          if(state.isEnabled){
            colorText = Colors.white;
            colorButton = Colors.lightGreenAccent;
            colorIcon = Colors.lightGreenAccent;
            text_on_off = "Pulse para apagar";
          }else{
            colorText = Colors.grey;
            colorButton = Colors.white;
            colorIcon = Colors.grey;
            text_on_off = "Pulse para encender";
          }
          return Container(
            margin: EdgeInsets.all(20),
            width: 462,
            height: 388,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    left: 50,
                    top: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(title,
                        style: MyTextStyle.estiloBold(35, colorText),),
                    )
                ),
                Positioned.fill(
                    left: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(state.valueTemp.toString(),
                        style: MyTextStyle.estiloBold(100, colorText),),
                    )
                ),
                Positioned.fill(
                    left: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD(
                          "assets/icons/fire.svg", colorIcon, 130),
                    )
                ),
                Positioned.fill(
                    left: 30,
                    bottom: 22,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Pulse para apagar",
                        style: MyTextStyle.estiloBold(20, colorText),),
                    )
                ),
                Positioned.fill(
                    right: 170,
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(Icons.power_settings_new), iconSize: 30,
                        color: colorButton,
                        onPressed: () {
                          if(state.isEnabled){
                            calefaccionBloc.add(DisableCalefaccion());
                          }else{
                            calefaccionBloc.add(EnableCalefaccion());
                          }
                        },),
                    )
                ),
                Positioned.fill(
                  top: 20,
                  left: 20,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: circuloConSombra(20.0, colorIcon),
                  ),
                ),
                Positioned(
                  left: 320,
                  bottom: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: iconSvgNc("assets/icons/circulo_boiler.svg",390 ),
                  ),
                ),
                Positioned(
                  left: 320,
                  child: Align(
                    alignment: Alignment.center,
                    child: circularList(calefaccionBloc),
                  ),
                ),
                Positioned(
                  bottom: 10, right: 10,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child:Text("15ºC",
                    style: MyTextStyle.estiloBold(20, Colors.white),),
                  ),
                ),
                Positioned(
                  top: 10, right: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child:Text("35ºC",
                      style: MyTextStyle.estiloBold(20, Colors.white),),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }



// (-pi, 0.0)
  Widget circularList(calefaccionBloc) {
    double  _lastAngle, _valueTemp;
    return
      BlocBuilder<CalefaccionBloc,CalefaccionState>(
          builder: ( context, state) {
            return
            Container(
              child: Transform.rotate(
                angle: 135,
                child: CircleList(
                  dragAngleRange: DragAngleRange(-1.05, 1.15),
                  onDragUpdate: (PolarCoord updatedCord) {
                    print("onDragUpdate");
                    print("getAngle().toString(): " + updatedCord.getAngle().toString());
                    _lastAngle = updatedCord.getAngle();
                    if (_lastAngle > 67) {
                      _lastAngle = 67;
                    } else if (_lastAngle < -67) {
                      _lastAngle = -67;
                    }
                   // _valueTemp = (_lastAngle / 6.5);
                    calefaccionBloc.add(UpdateCalefaccion(_lastAngle));
                  },
                 // initialAngle: state.valueAngle,
                  outerRadius: 192,
                  innerRadius: 150,
                  origin: Offset(0, 0),
                  children: [
                    circuloConSombra(20.0, Colors.lightGreenAccent),
                  ],
                ),
              ),
            );
          }
    );
  }

  Widget circulito(size, color) {
    //this is base circle
    return Container(
      child: CustomPaint(
          painter: DrawCircle(size, color, PaintingStyle.stroke, 3.0)),
    );
  }


}/// Fin clase