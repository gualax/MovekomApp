


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
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
    SizeConfig().init(context);
    final boilerBloc = BlocProvider.of<BoilerBloc>(context);
 // print(_angleValue);
  return BlocBuilder(
    bloc: boilerBloc,
    builder: (BuildContext context, BoilerState state) {
   //   print("state.valueCord:" + state.valueCord.toString());
      return Container(
        child: Transform.rotate(
          angle: state.valueCord/4 * math.pi,
          child: Container(
            padding: EdgeInsets.all(10),
            child: circuloBoiler(),
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
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: iconSvgNc("assets/icons/circulo_boiler.svg", 300),
              )
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child:exported(155.0),
              )
          ),
          Positioned.fill(
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
      height: 45,
        width: 15,
        decoration: new BoxDecoration(
          color: Color(0xff000000),
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [BoxShadow(
              color: Color(0xff94e538),
              offset: Offset(0,0),
              blurRadius: 15,
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
            blurRadius: 10,
            spreadRadius: 0
        )
        ],
      ),
    );
  }
  
}
