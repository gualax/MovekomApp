


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'dart:math' as math;

import '../../Utils/SizeConfig.dart';

class AnimatedBoiler extends StatefulWidget {
  @override
  _AnimatedBoilerState createState() => _AnimatedBoilerState();
}

class _AnimatedBoilerState extends State<AnimatedBoiler>
with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double _angleValue;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _angleValue = widget.angleValue;
    animationController = AnimationController(
        duration:  Duration(seconds: 5),
        vsync:this,);

    animation = Tween<double>(
        begin: 0, end: 2 * math.pi)
        .animate(animationController)
        ..addListener((){
          setState(() {});
        })
        ..addStatusListener((status){
          if(status == AnimationStatus.completed){
            animationController.reverse();
          }else if (status == AnimationStatus.dismissed){
              animationController.forward();
          }
        });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final boilerBloc = BlocProvider.of<BoilerBloc>(context);
 // print(_angleValue);
  return BlocBuilder(
    bloc: boilerBloc,
    builder: (BuildContext context, BoilerState state) {
     // print("valueCord:" + state.valueCord.toString());
    //  print("amgle:" + (state.valueCord * math.pi).toString());
      return Container(
      //  color: Colors.amber,
        child: Transform.rotate(
          angle: -0.5 * math.pi,
          child: Container(
            padding: EdgeInsets.all(SC.all(10)),
            child: Transform.rotate(
              angle: state.valueCord/3 * math.pi,  //el valor del num / la mitad d los elementos si son 6 enotnces divido *3
              child: circuloBoiler(),
            ),
          ),
        ),
      );
    }
  );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  Widget circuloBoiler(){
  return Container(
  //  color: Colors.pink,
      child: Stack(
        children: <Widget>[
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: iconSvgNc("assets/icons/circulo_boiler.svg", 300),
              )
          ),
          MyPositioned.fill(
              child: Align(
                alignment: Alignment.center,
                child:exported(SC.all(155)),
              )
          ),
          MyPositioned.fill(
              top: 170,
              child: Align(
                alignment: Alignment.topCenter,
                child:indicador(),
              )
          ),
        ],
      ),
  );
  }
  void changeValue(newValue){
  setState(() {
    _angleValue = newValue;
  });
  }

  Widget indicador(){
    return Container(
      height: SC.hei(45),
        width: SC.wid(15),
        decoration: new BoxDecoration(
          color: Color(0xff000000),
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [BoxShadow(
              color: Color(0xff94e538),
              offset: Offset(0,0),
              blurRadius: SC.all(15),
              spreadRadius: 0
          ) ],
        ),
     // child:  iconSvgNc("assets/icons/indicador_boiler.svg", 90),
    );
  }

  Widget exported(dim) {
    return Container(
      width: dim,
      height: dim,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff474747),
        boxShadow: [BoxShadow(
            color: Color(0xff94e538),
            offset: Offset(0, 0),
            blurRadius: SC.all(10),
            spreadRadius: 0
        )
        ],
      ),
    );
  }
  
}
