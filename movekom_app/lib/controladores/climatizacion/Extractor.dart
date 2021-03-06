import 'package:circle_list/circle_list.dart';
import 'package:circle_list/radial_drag_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/climatizacion/extractor_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';


class Extractor extends StatefulWidget {
  @override
  _ExtractorState createState() => _ExtractorState();
}

class _ExtractorState extends State<Extractor> {
  String title = "EXTRACTOR";
  ExtractorBloc bloc;
  @override
  Widget build(BuildContext context) {
    return extractor();
  }

  Widget extractor() {
    Color colorIcon, colorImg, colorText;
    String on_off;
    return
      BlocBuilder<ExtractorBloc, ExtractorState>(
        builder: (context, state) {
          bloc = BlocProvider.of<ExtractorBloc>(context);
          if(state.isEnabled){
            colorIcon = MyColors.principal;
            colorImg = MyColors.principal;
            colorText = MyColors.text;
            on_off = "Pulse para apagar";
          } else{
            colorIcon = MyColors.text;
            colorImg = MyColors.inactive;
            colorText = MyColors.inactive;
            on_off = "Pulse para encender";
          }
          return
              MyContainer(
              margin: EdgeInsets.all(SC.all(7)),
              width: 450,
              height: 220,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: <Widget>[
                  MyPositioned.fill(
                      left: 35,
                      top: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title,
                          style: MyTextStyle.estiloBold(20, colorText),),
                      )
                  ),
                  MyPositioned.fill(
                      left: 20,
                      top: 10,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: iconSvgD("assets/icons/fan.svg", colorImg, 70),
                      )
                  ),
                  MyPositioned.fill(
                      left: 10,
                      top: 15,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: circuloConSombra(15, colorImg),
                      )
                  ),
                  MyPositioned.fill(
                    left: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: MyContainer(
                     //   color: Colors.blue,
                        height: 70,
                        width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                           Align(
                              alignment: Alignment.center,
                              child: Text(state.valueExt.toString(),
                                style: MyTextStyle.estiloBold(70, colorText),),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("ºC",
                                style: MyTextStyle.estiloBold(40, colorText),),
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                  MyPositioned.fill(
                      left: 20,
                      bottom: 15,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(on_off,
                          style: MyTextStyle.estiloBold(17, colorText),),
                      )
                  ),
                  MyPositioned(
                    left: 380,
                    bottom: 1, top: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: extractor_indic_img(148.0),
                    ),
                  ),
                  MyPositioned(
                   left: 380,
                    top:30,
                    child: Align(
                      alignment: Alignment.center,
                        child: circularListExtractor(SC.all(75.0),SC.all(53)),
                    ),
                  ),
                  MyPositioned(
                    bottom: 5, right: 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child:Text("15ºC",
                        style: MyTextStyle.estiloBold(16, MyColors.text),),
                    ),
                  ),
                  MyPositioned(
                    top: 5, right: 10,
                    child: Align(
                      alignment: Alignment.topRight,
                      child:Text("35ºC",
                        style: MyTextStyle.estiloBold(16, MyColors.text),),
                    ),
                  ),
                  MyPositioned.fill(
                      right: 160, bottom: 17,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: iconSvgD("assets/icons/on_off.svg", colorIcon, 20),
                      )
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyContainer(
                      width: 300,
                      height: 174,
                      child: GestureDetector(
                        onTap: (){
                          if(state.isEnabled){
                            bloc.add(DisableExtractor());
                          }else{
                            bloc.add(EnableExtractor());
                          }
                        },
                      ),
                    ),
                  ),
                ],
            )
          );
        }
      );
  }


  Widget circularListExtractor(outerRadius,innerRadius) {
    double  _lastAngle, _radAngle;
    return
      BlocBuilder<ExtractorBloc,ExtractorState>(
          builder: ( context, state) {
            bloc = BlocProvider.of<ExtractorBloc>(context);
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
                      bloc.add(UpdateExtractor(_lastAngle,_radAngle));
                    },
                  //  innerCircleColor: Colors.amber,
                  //  outerCircleColor: Colors.cyan,
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



  Widget extractor_indic_img(dim){
    return MyContainer(
        height: dim,
        width: dim,
        //margin: EdgeInsets.all(dim),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/extractor10.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }


}
