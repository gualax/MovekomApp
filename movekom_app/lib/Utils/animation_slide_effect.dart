import 'package:flutter/material.dart';

class TransitionAnimationSlide extends StatefulWidget {
  TransitionAnimationSlide({Key key,this.widgetToAnim,this.index}) : super(key: key);
  Widget widgetToAnim;
  int index;
  @override
  _TransitionAnimationSlideState createState() => _TransitionAnimationSlideState();
}

class _TransitionAnimationSlideState extends State<TransitionAnimationSlide>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Widget _widget;

  double _direction = 1.0;

  @override
  void initState() {
    super.initState();
    print("MyStatefulWidget///initState");
    _widget = widget.widgetToAnim;
  }

  @override
  void dispose() {
    super.dispose();
    print("MyStatefulWidget///dispose");

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("MyStatefulWidget///build");
    if(widget.index > 0){
      _direction = 1.0 * 0.5;
    }else{
      _direction = -1.0 * 0.5 ;
    }
    print(_direction);
    _widget = widget.widgetToAnim;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin:  Offset(_direction,0),
      end: Offset.zero, //Offset.zero
    ).animate(_controller);
    _controller.forward();
    return  SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: _widget,
        ),
    );
  }
}