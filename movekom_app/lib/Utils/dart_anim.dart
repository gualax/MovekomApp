import 'package:flutter/material.dart';

class TransitionAnimation extends StatefulWidget {
  TransitionAnimation({Key key,this.widgetToAnim}) : super(key: key);
  Widget widgetToAnim;
  @override
  _TransitionAnimationState createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Widget _widget;

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
    _widget = widget.widgetToAnim;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.1),
      end: Offset.zero, //Offset.zero
    ).animate(_controller);
    _controller.forward();
    return Container(
      child: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: _widget,
        ),
      ),
    );
  }
}