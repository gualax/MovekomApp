
import 'package:circle_list/circle_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/my_radial_position.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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



 Widget calefContainer(){
   return
     BlocBuilder<CalefaccionBloc,CalefaccionState>(
         builder: ( context, state) {
   return MyContainer(
        margin: EdgeInsets.only(top: SC.top(6),bottom: SC.bot(6),left: SC.left(10),right: SC.right(10)),
        width: 600,
        height: 410,
        decoration: new BoxDecoration(
      //  color: Colors.amber
      ),
   child: Stack(
   children: <Widget>[
     MyContainer(
       margin: EdgeInsets.only(top: SC.top(6),bottom: SC.bot(6),left: SC.left(10),right: SC.right(10)),
       width: 500,
       height: 410,
      color: MyColors.baseColor,
     child: Stack(
       children: <Widget>[
         MyPositioned(
           left: 365, bottom: 20, //270 //13
           child: Align(
             alignment: Alignment.center,
             child: calefa_img(360.0),
           ),
         ),
        ],
        ),
       ),
     MyPositioned.fill(
       child: Align(
         alignment: Alignment.center,
         child: new GestureDetector(
           onVerticalDragUpdate: _onVerticalDragUpdate,
           onHorizontalDragUpdate: _onHorizontalDragUpdate,
           child: MyContainer(
             height: 400,
             width: 150,
             color: Colors.transparent,
           ),
         ),
       ),
     ),
     Align(
       child: MyRadialPosition(
         radius: SC.all(150), //130
         angle: angleToRad(angleDelta),
         child: new GestureDetector(
           //  onPanUpdate: _onPanUpdate,
             onVerticalDragUpdate: _onVerticalDragUpdate,
             onHorizontalDragUpdate: _onHorizontalDragUpdate,
             child: MyContainer(
               child:Stack(
                 children: <Widget>[
                   MyPositioned.fill(
                     right: 35,
                     child: Align(
                         alignment: Alignment.centerRight,
                         child: flechaIndicador(angleToRad(angleDelta),70.0)),
                   ),
                 ],
               ),
             )),
       ),
     ),
   ],
     ),
   );
         }
     );
 }




  void _onVerticalDragUpdate(DragUpdateDetails details) {
    print("*** Vertical dx : " + details.delta.dx.toString());
    print("*** Vertical dy : " + details.delta.dy.toString());
    angleDelta = angleDelta - ((details.delta.dy).roundToDouble() /2);
  //  calefaccionBloc.add(UpdateCalefaccion(angleDelta,angleDelta));
    setState((){});
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    print("*** Horizontal dx : " + details.delta.dx.toString());
    print("*** Horizontal dy : " + details.delta.dy.toString());
    angleDelta = angleDelta + ((details.delta.dx).roundToDouble()/2);
   // calefaccionBloc.add(UpdateCalefaccion(angleDelta,angleDelta));
    setState((){});
  }

  double angleToRad(angle){
    double converted = angle * pi / 180.0;
    //calefaccionBloc.add(UpdateCalefaccion(converted,converted));
    print("converted: " + converted.toString());
      if (converted > ((pi / 2) + 0.5) && converted < ((pi * 1.5) - 0.5) ) {
        return converted;
      } else if (converted <= ((pi / 2) + 0.5)) {
        return (pi / 2) + 0.5;
      } else {
        return ((pi * 1.5) - 0.5) ;
      }
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
                      //calefaccionBloc.add(UpdateCalefaccion(_lastAngle,_radAngle));
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




}
