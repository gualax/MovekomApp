import 'package:flutter/material.dart';



class DrawCircle extends CustomPainter {
  Paint _paint;
  double _size;
  PaintingStyle _style;

  DrawCircle(size,color,style,strokeWidth) {
    _size = size;
    _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style =  style;
  }


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0),_size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
