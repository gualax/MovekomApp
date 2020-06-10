import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key,this.widgetToAnim}) : super(key: key);
  Widget widgetToAnim;
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
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
      begin: const Offset(1.1, 0.0),
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