

import 'package:circle_list/circle_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/mi_circle_slider.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';
import 'dart:math';

class Calefaccion extends StatefulWidget {
  int widgetType;

  Calefaccion(this.widgetType);

  @override
  _CalefaccionState createState() => _CalefaccionState();
}

class _CalefaccionState extends State<Calefaccion> {
  final String title = "CALEFACCION";
  bool isFisrtRender = true;
  CalefaccionBloc calefaccionBloc;

  @override
  Widget build(BuildContext context) {
    SC().init(context);
     calefaccionBloc = BlocProvider.of<CalefaccionBloc>(context);
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
              colorText = MyColors.text;
              colorButton = MyColors.principal;
              colorIcon = MyColors.principal;
              text_on_off = "Pulse para apagar";
            }else{
              colorText = MyColors.inactive;
              colorButton = MyColors.text;
              colorIcon = MyColors.inactive;
              text_on_off = "Pulse para encender";
            }
            return  MyContainer(
                margin: EdgeInsets.only(top: SC.top(6),bottom: SC.bot(6),left: SC.left(10),right: SC.right(10)),
                width: 500,
                height: 410,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 40,
                        top: 10,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(title,
                            style: MyTextStyle.estiloBold(25, colorText),),
                        )
                    ),
                    MyPositioned.fill(
                      bottom: 120,
                        right: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Temperature ºC",
                            style: MyTextStyle.estiloBold(18, colorText),),
                        )
                    ),
                    MyPositioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(state.valueTemp.toString(),
                            style: MyTextStyle.estiloBold(100, colorText),),
                        )
                    ),
                    MyPositioned.fill(
                        left: 20,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: iconSvgD(
                              "assets/icons/fire.svg", colorIcon, 130),
                        ),
                    ),
                    MyPositioned.fill(
                        left: 5,
                        bottom: 30,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(text_on_off,
                            style: MyTextStyle.estiloBold(20, colorText),),
                        )
                    ),
                    MyPositioned.fill(
                        right: 210, bottom:33,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: iconSvgD("assets/icons/on_off.svg", colorIcon, 25),
                        )
                    ),
                    MyPositioned.fill(
                      top: 15,
                      left: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: circuloConSombra(20.0, colorIcon),
                      ),
                    ),
                    MyPositioned(
                      left: 365, bottom: 20, //270 //13
                      child: Align(
                        alignment: Alignment.center,
                         child: calefa_img(360.0),
                      ),
                    ),
                    MyPositioned(
                      left: 360, //270
                      top: 25,
                       child: flechita_indicacion(SC.all(180),SC.all(135)), //200 //160
                  //    child: MyCircleSlider(),
                    ),
                    MyPositioned(
                      bottom: 10, right: 10,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child:Text("15ºC",
                          style: MyTextStyle.estiloBold(20, MyColors.text),),
                      ),
                    ),
                    MyPositioned(
                      top: 10, right: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child:Text("35ºC",
                          style: MyTextStyle.estiloBold(20, MyColors.text),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyContainer(
                        width: 265,
                        height: 400,
                    //    color: Colors.green,
                        child: GestureDetector(
                          onTap: (){
                            if(state.isEnabled){
                              calefaccionBloc.add(DisableCalefaccion());
                            }else{
                              calefaccionBloc.add(EnableCalefaccion());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            );
          }
      );
  }



// (-pi, 0.0)
  Widget flechita_indicacion(outerRadius,innerRadius) {
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
              colorIndic = MyColors.inactive;
            }
            return
                 MyContainer(
                    child: Transform.rotate(
                        angle: pi,//135
                      child: CircleList(
                        dragAngleRange: DragAngleRange(-0.02, 0.02),   //-0.02 , 0.02
                        onDragUpdate: (PolarCoord updatedCord) {
                          _lastAngle = updatedCord.getAngle();
                          _radAngle = updatedCord.angle;
                          if (_lastAngle > 50) {
                            _lastAngle = 50;
                          } else if (_lastAngle < -45) {
                            _lastAngle = -45;
                          }
                          if (_radAngle > 1) {
                            _radAngle = 1;
                          } else if (_radAngle < -1) {
                            _radAngle = -1;
                          }
                          calefaccionBloc.add(UpdateCalefaccion(_lastAngle,_radAngle));
                        },
                      //  outerCircleColor: Colors.blueGrey[200],
                       // innerCircleColor: Colors.blue,
                        rotateMode: rotateMode,
                        initialAngle:_radAngle,
                        outerRadius: outerRadius,
                        innerRadius: innerRadius,
                        origin: Offset(0,0),
                        children: [
                          flechaIndicador(_radAngle,70.0),
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

  Widget calefa_img(dim){
    return MyContainer(
            height: dim,
            width: dim,
            //margin: EdgeInsets.all(dim),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/calefaccion10.png"),
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
          colorText = MyColors.text;
          on_off = "ON";
        } else {
          color = MyColors.inactive;
          colorText = MyColors.inactive;
          on_off = "OFF";
       }
    return  ClipRect(
      child: MyContainer(
          margin: EdgeInsets.all(SC.all(7)),
          width: 225,
          height: 140,
          decoration: BoxDecoration(
              color:  MyColors.baseColor
          ),
          child: Stack(children: [
            // Valvulas (Todas)
            MyPositioned.fill(  ///titulo
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
            MyPositioned.fill(/// circulito
                top: 10, right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: circuloConSombra(17.0, color),
                )
            ),
            MyPositioned.fill(    ///textAbajoIzq
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
            MyPositioned.fill(  ///textAbajoDer
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
            MyPositioned.fill(  ///icon
              left: 25,
              child:  Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/fire.svg", color, 75),
              ),
            ),
            MyPositioned.fill(  ///textValue
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
