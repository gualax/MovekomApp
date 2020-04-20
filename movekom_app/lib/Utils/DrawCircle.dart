import 'package:flutter/material.dart';



class DrawCircle extends CustomPainter {
  Paint _paint;
  double _size;

  DrawCircle(size,color) {
    _size = size;
    _paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style =  PaintingStyle.stroke;
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
