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
            on_off = "Presionar para apagar";
          } else{
            colorIcon = MyColors.text;
            colorImg = MyColors.inactive;
            colorText = MyColors.inactive;
            on_off = "Presionar para encender";
          }
          return
          MyContainer(
            margin: EdgeInsets.all(SC.all(7)),
            width: 380,
            height: 174,
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
                      child: Text(state.valueExt.toString(),
                        style: MyTextStyle.estiloBold(70, colorText),),
                    )
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
                  left: 320,
                  bottom: 1, top: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: extractor_indic_img(148.0),
                  ),
                ),
                MyPositioned(
                 left: 320,
                  top:13,
                  child: Align(
                    alignment: Alignment.center,
                    child: circularListExtractor(SC.all(75.0),SC.all(60)),
                  ),
                ),
                MyPositioned.fill(
                    right: 200, top: 120,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(Icons.power_settings_new), iconSize: SC.all(25),
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
            image: AssetImage("assets/images/circulo_boiler_img.png"),
            fit: BoxFit.contain,
          ),
        )
    );
  }


}
