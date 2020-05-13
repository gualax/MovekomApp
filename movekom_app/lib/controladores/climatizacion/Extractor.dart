import 'package:circle_list/circle_list.dart';
import 'package:circle_list/radial_drag_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/climatizacion/extractor_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/flecha_indicador.dart';


class Extractor extends StatefulWidget {
  @override
  _ExtractorState createState() => _ExtractorState();
}

class _ExtractorState extends State<Extractor> {
  String title = "Extractor";
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
            colorIcon = Colors.lightGreenAccent;
            colorImg = Colors.lightGreenAccent;
            colorText = Colors.white;
            on_off = "Presionar para apagar";
          } else{
            colorIcon = Colors.white;
            colorImg = Colors.grey;
            colorText = Colors.grey;
            on_off = "Presionar para encender";
          }
          return
          Container(
            margin: EdgeInsets.all(5),
            width: 420,
            height: 174,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    left: 10,
                    top: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(title,
                        style: MyTextStyle.estiloBold(30, colorText),),
                    )
                ),
                Positioned.fill(
                    left: 20,
                    top: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/fan.svg", colorImg, 70),
                    )
                ),
                Positioned.fill(
                    left: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(state.valueExt.toString(),
                        style: MyTextStyle.estiloBold(70, colorText),),
                    )
                ),
                Positioned.fill(
                    left: 30,
                    bottom: 15,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(on_off,
                        style: MyTextStyle.estiloBold(20, colorText),),
                    )
                ),
                Positioned(
                  left: 360,
                  bottom: 1, top: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: calefa_indic_img(148.0),
                  ),
                ),
                Positioned(
                 left: 360,
                  top:13,
                  child: Align(
                    alignment: Alignment.center,
                    child: circularList(75.0,60.0),
                  ),
                ),
                Positioned.fill(
                    right: 200,
                    bottom: 5,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(Icons.power_settings_new), iconSize: 30,
                        color: colorIcon,
                        onPressed: () {
                          print("state" + state.isEnabled.toString());
                          if(state.isEnabled){
                            bloc.add(DisableExtractor());
                          }else{
                            bloc.add(EnableExtractor());
                          }
                        },),
                    )
                ),
              ],
            ),
          );
        }
      );
  }


  Widget circularList(outerRadius,innerRadius) {
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
                      bloc.add(UpdateExtractor(_lastAngle,_radAngle));
                    },
                    rotateMode: rotateMode,
                    initialAngle:_radAngle,
                    outerRadius: outerRadius,
                    innerRadius: innerRadius,
                    origin: Offset(0, 0),
                    children: [
                      flechaIndicador(_radAngle,35.0),
                    ],
                  ),
                ),
              );
          }
      );
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


}
