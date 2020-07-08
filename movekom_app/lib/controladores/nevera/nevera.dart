


import 'package:circle_list/circle_list.dart';
import 'package:circle_list/radial_drag_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/Dimensiones.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/electricidad_blocs/nevera_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';

class Nevera extends StatefulWidget {
  int widgetType;

  Nevera(this.widgetType);
  @override
  _ExtractorState createState() => _ExtractorState();
}





class _ExtractorState extends State<Nevera> {
  String title = "NEVERA";
  NeveraBloc bloc;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void didUpdateWidget(Nevera oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    if (widget.widgetType == 1) {
      return nevera_principal();
    } else if (widget.widgetType == 2) {
      return nevera_big();
    }else {
        return nevera_widget();
    }
  }

  Widget nevera_big() {
    Color colorIcon, colorImg, colorText;
    String on_off;
    return
      BlocBuilder<NeveraBloc, NeveraState>(
          builder: (context, state) {
            bloc = BlocProvider.of<NeveraBloc>(context);
            if(state.isEnabled){
              colorIcon = MyColors.principal;
              colorImg = MyColors.principal;
              colorText = MyColors.text;
              on_off = "Pulsar para apagar";
            } else{
              colorIcon = MyColors.text;
              colorImg = MyColors.inactive;
              colorText = MyColors.inactive;
              on_off = "Pulsar para encender";
            }
            return GestureDetector(
              onTap: (){
                print("state" + state.isEnabled.toString());
                if(state.isEnabled){
                  bloc.add(DisableNevera());
                }else{
                  bloc.add(EnableNevera());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(Dimens.TOOLS_SEPARATION)),
                width: 420, height: 220,
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                  child: Stack(
                    children: <Widget>[
                      MyPositioned.fill(
                          left: 35,
                          top: 10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(title,
                              style: MyTextStyle.estiloBold(25, colorText),),
                          )
                      ),
                      MyPositioned.fill(
                          left: 20,
                          top: 10,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: iconSvgD("assets/icons/nevera.svg", colorImg, 90),
                          )
                      ),
                      MyPositioned.fill(
                          top: 20, right: 20,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: circuloConSombra(20, colorImg),
                          )
                      ),
                      MyPositioned.fill(
                          bottom: 15,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(on_off,
                              style: MyTextStyle.estiloBold(15, colorText),),
                          )
                      ),
                      MyPositioned.fill(
                          left: 100, bottom: 13,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: iconSvgD("assets/icons/on_off.svg", colorIcon, 30),
                          )
                      ),
                    ],
                  ),
                ),
            );
          }
      );
  }


  Widget circularList(outerRadius,innerRadius) {
    double  _lastAngle, _radAngle;
    return
      BlocBuilder<NeveraBloc,NeveraState>(
          builder: ( context, state) {
            bloc = BlocProvider.of<NeveraBloc>(context);
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
                //    innerCircleColor: Colors.red,
                 //   outerCircleColor:Colors.cyanAccent ,
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
                      bloc.add(UpdateNevera(_lastAngle,_radAngle));
                    },
                    rotateMode: rotateMode,
                    initialAngle:_radAngle,
                    outerRadius: outerRadius,
                    innerRadius: innerRadius,
                    origin: Offset(0, 0),
                    children: [
                      flechaIndicador(_radAngle,40.0),
                    ],
                  ),
                ),
              );
          }
      );
  }



  Widget nevera_indic_img(dim){
    return MyContainer(
        height: dim,
        width: dim,
        //margin: EdgeInsets.all(dim),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nevera_rueda_img.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }


  Widget nevera_principal() {
    String on_off;
    Color colorIcon;
    return
      BlocBuilder<NeveraBloc, NeveraState>(
         builder: (context, state) {
        bloc = BlocProvider.of<NeveraBloc>(context);
        if(state.isEnabled){
          on_off = "ON";
          colorIcon = MyColors.principal;
        }else {
          on_off = "OFF";
          colorIcon = MyColors.inactive;
        }
        return   GestureDetector(
          onTap: (){
            bloc.add(DisableNevera());
            if(state.isEnabled){
            }else {
              bloc.add(EnableNevera());
            }
            },
          child: MyContainer(
          margin: EdgeInsets.all(SC.all(7)),
          width: 134,
          height: 134,
          decoration: new BoxDecoration(
          color: MyColors.baseColor
          ), child: Stack(
            children: <Widget>[
              MyPositioned.fill(
                top:5,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("NEVERA",
                      style:MyTextStyle.estiloBold(15, MyColors.text)),
                  )
              ),
              MyPositioned.fill(
                  top:5,
                  child: Align(
                    alignment: Alignment.center,
                    child: iconSvgD("assets/icons/nevera.svg",colorIcon, 70),
                  )
              ),
              MyPositioned.fill(
                  top:10, right: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: circuloConSombra(10, MyColors.principal),
                  )
              ),
              MyPositioned.fill(
                  top:10, right: 10,
                  child: Align(
                alignment: Alignment.topRight,
                child: circuloConSombra(10,colorIcon),
              )
              ),
              MyPositioned.fill(
                  bottom:5, left: 5,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(on_off,
                        style:MyTextStyle.estiloBold(15, colorIcon)),
                  )
              ),
            ],
      )
      ),
        );
        }
      );
  }



  Widget nevera_widget() {
    return
      BlocBuilder<NeveraBloc, NeveraState>(
          builder: (context, state) {
            bloc = BlocProvider.of<NeveraBloc>(context);
            return   MyContainer(
                margin: EdgeInsets.all(SC.all(7)),
                width: 105.5,
                height: 140,
                decoration: new BoxDecoration(
                    color: MyColors.baseColor
                ), child: Stack(
              children: <Widget>[
                MyPositioned.fill(
                    top:5,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text("NEVERA",
                          style:MyTextStyle.estiloBold(15, MyColors.text)),
                    )
                ),
                MyPositioned.fill(
                    top:5,
                    child: Align(
                      alignment: Alignment.center,
                      child: iconSvgD("assets/icons/nevera.svg", MyColors.white, 70),
                    )
                ),
                MyPositioned.fill(
                    top:5, right: 5,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: circuloConSombra(10, MyColors.white),
                    )
                ),
              ],
            )
            );
          }
      );
  }
  }