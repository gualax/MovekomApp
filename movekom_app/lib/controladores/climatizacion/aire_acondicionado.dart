

import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/climatizacion/aire_acondicionado_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';

class AireAcondicionado extends StatefulWidget {
  int widgetType;

  AireAcondicionado(this.widgetType);
  @override
  _AireAcondicionadoState createState() => _AireAcondicionadoState();
}

class _AireAcondicionadoState extends State<AireAcondicionado> {
  final String title = "AIRE ACONDICIONADO";
  bool isFisrtRender = true;
  AireAcondicionadoBloc acondicionadoBloc;
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    acondicionadoBloc = BlocProvider.of<AireAcondicionadoBloc>(context);
    if (widget.widgetType == 1) {
      return _aireAcondWidget();
    } else {
      return aire_acondicionado_big();
    }
  }



  Widget aire_acondicionado_big() {
    Color colorText, colorIcon, colorButton;
    String text_on_off;
    return
      BlocBuilder<AireAcondicionadoBloc,AireAcondicionadoState>(
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
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  acondicionadoBloc.add(DisableAireAcondicionado());
                }else{
                  acondicionadoBloc.add(EnableAireAcondicionado());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(12)),
                width: 380,
                height: 388,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        left: 50,
                        top: 15,
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
                        left: 20,
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
                        )
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
                        right: 230, top:300,
                        child: Align(
                      //    alignment: Alignment.bottomCenter,
                          child: IconButton(
                            icon: Icon(Icons.power_settings_new), iconSize: SC.all(30),
                            color: colorButton,
                            onPressed: () {
                              if(state.isEnabled){
                                acondicionadoBloc.add(DisableAireAcondicionado());
                              }else{
                                acondicionadoBloc.add(EnableAireAcondicionado());
                              }
                            },),
                        )
                    ),
                    MyPositioned.fill(
                      top: 22,
                      left: 20,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: circuloConSombra(15.0, colorIcon),
                      ),
                    ),
                    MyPositioned(
                      left: 270,
                      bottom: 14,
                      child: Align(
                        alignment: Alignment.center,
                        child: aire_acond_indic_img(360.0),
                      ),
                    ),
                    MyPositioned(
                      left: 270,
                      child: Align(
                        alignment: Alignment.center,
                        child: circularListAA(SC.all(192),SC.all(150)),
                      ),
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
                  ],
                ),
              ),
            );
          }
      );
  }



// (-pi, 0.0)
  Widget circularListAA(outerRadius,innerRadius) {
    double  _lastAngle, _radAngle;
    return
      BlocBuilder<AireAcondicionadoBloc,AireAcondicionadoState>(
          builder: ( context, state) {
            RotateMode rotateMode;
            Color colorIndic;
            _radAngle = state.radAngle;
            _lastAngle = state.valueAngle;
            if(state.isEnabled){
              rotateMode = RotateMode.allRotate;
              colorIndic = MyColors.principal;
            }else{
              rotateMode = RotateMode.stopRotate;
              colorIndic = MyColors.inactive;
            }
            return
              MyContainer(
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
                      acondicionadoBloc.add(UpdateAireAcondicionado(_lastAngle,_radAngle));
                    },
                    rotateMode: rotateMode,
                    initialAngle:_radAngle,
                    outerRadius: outerRadius,
                    innerRadius: innerRadius,
                    origin: Offset(0, 0),
                    children: [
                      flechaIndicador(_radAngle,60.0),
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

  Widget aire_acond_indic_img(dim){
    return MyContainer(
        height: dim,
        width: dim,
        //margin: EdgeInsets.all(dim),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/aire_acond_img.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }


  Widget _aireAcondWidget(){
    Color color;
    Color colorText;
    String on_off;
    return BlocBuilder<AireAcondicionadoBloc,AireAcondicionadoState>(
        builder: ( context, state) {
          if(state.isEnabled){
            color = MyColors.principal;
            colorText = MyColors.text;
            on_off = "ON";
          } else {
            color = MyColors.inactive;
            colorText = MyColors.inactive;
            on_off = "OFF";
          }
          return  ClipRect(
            child: MyContainer(
                margin: EdgeInsets.all(7),
                width: 225,
                height: 140,
                decoration: BoxDecoration(
                    color:  MyColors.baseColor
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
