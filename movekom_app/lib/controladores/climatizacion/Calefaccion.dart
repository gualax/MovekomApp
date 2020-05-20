

import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';

class Calefaccion extends StatefulWidget {
  int widgetType;

  Calefaccion(this.widgetType);
  @override
  _CalefaccionState createState() => _CalefaccionState();
}

class _CalefaccionState extends State<Calefaccion> {
  final String title = "CALEFACCION";
  bool isFisrtRender = true;
  @override
  Widget build(BuildContext context) {
    final calefaccionBloc = BlocProvider.of<CalefaccionBloc>(context);
    if (widget.widgetType == 1) {
      return _calefaccionWidget();
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
                    bottom: 120,
                      right: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Temperature ºC",
                          style: MyTextStyle.estiloBold(20, colorText),),
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
                        child: Text(text_on_off,
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
                    bottom: 14,
                    child: Align(
                      alignment: Alignment.center,
                   //   child: iconSvgNc("assets/icons/circulo_boiler.svg",390 ),
                        child: calefa_indic_img(360.0),
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
    double  _lastAngle, _radAngle;
    return
      BlocBuilder<CalefaccionBloc,CalefaccionState>(
          builder: ( context, state) {
            RotateMode rotateMode;
            Color colorIndic;
            _radAngle = state.radAngle;
            _lastAngle = state.valueAngle;
            if(state.isEnabled){
              rotateMode = RotateMode.allRotate;
              colorIndic = Colors.lightGreenAccent;
            }else{
              rotateMode = RotateMode.stopRotate;
              colorIndic = Colors.grey;
            }
            return
              Container(
                child: Transform.rotate(
                  angle: 135,
                  child: CircleList(
                    dragAngleRange: DragAngleRange(-0.02, 0.02),
                    onDragUpdate: (PolarCoord updatedCord) {
                      _lastAngle = updatedCord.getAngle();
                      _radAngle = updatedCord.angle;
                      if (_lastAngle > 57) {
                        _lastAngle = 57;
                      } else if (_lastAngle < -55) {
                        _lastAngle = -55;
                      }
                      if (_radAngle > 1) {
                        _radAngle = 1;
                      } else if (_radAngle < -1) {
                        _radAngle = -1;
                      }
                      // _valueTemp = (_lastAngle / 6.5);
                      calefaccionBloc.add(UpdateCalefaccion(_lastAngle,_radAngle));
                    },
                    rotateMode: rotateMode,
                    initialAngle:_radAngle,
                    outerRadius: 192,
                    innerRadius: 150,
                    origin: Offset(0, 0),
                    children: [
                      flechaIndicador(_radAngle,55.0),
                    ],
                  ),
                ),
              );
          }
      );
  }


  double getInitialAngle(angleValue){
    if(isFisrtRender){
      print(isFisrtRender);
      isFisrtRender = false;
      if(angleValue != null)
          return angleValue;
      return 0;
    }else {
      print(isFisrtRender);
      return 0;
    }
  }

  Widget calefa_indic_img(dim){
    return Container(
            height: dim,
            width: dim,
            //margin: EdgeInsets.all(dim),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/circulo_boiler_img.png"),
                fit: BoxFit.contain,
              ),
            )
    );
  }


  Widget _calefaccionWidget(){
    Color color;
    Color colorText;
    String on_off;
   return BlocBuilder<CalefaccionBloc,CalefaccionState>(
      builder: ( context, state) {
       if(state.isEnabled){
          color = Colors.lightGreenAccent;
          colorText = Colors.white;
          on_off = "ON";
        } else {
          color = Colors.grey;
          colorText = Colors.grey;
          on_off = "OFF";
       }
    return  ClipRect(
      child: Container(
          margin: EdgeInsets.all(7),
          width: 225,
          height: 140,
          decoration: BoxDecoration(
              color: const Color(0xff2d3033)
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            Positioned.fill(  ///titulo
              top: 4,
              left: 8,
              child:   Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: MyTextStyle.estiloBold(18, colorText),
                ),
              ),
            ),
            Positioned.fill(/// circulito
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(17.0, color),
                )
            ),
            Positioned.fill(    ///textAbajoIzq
              left: 8,
              bottom: 6,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  on_off,
                  style: MyTextStyle.estilo(18, color),
                ),
              ),
            ),
            Positioned.fill(  ///textAbajoDer
              right: 8,
              bottom: 6,
              child:  Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Consumo " + "2.65" + "A",
                  style: MyTextStyle.estilo(18, colorText),
                ),
              ),
            ),
            Positioned.fill(  ///icon
              left: 25,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/fire.svg", color, 75),
              ),
            ),
            Positioned.fill(  ///textValue
              right: 20,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.valueTemp.toString() + "ºC",
                  style: MyTextStyle.estiloBold(45, colorText),
                ),
              ),
            )
          ])
      ),
    );
     }
   );
  }


}
