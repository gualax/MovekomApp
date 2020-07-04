import 'dart:math';

import 'package:flutter/material.dart';

class MyRadialPosition extends StatelessWidget {
  final double radius;
  final double angle;
  final Widget child;

  MyRadialPosition({this.radius, this.angle, this.child});

  @override
  Widget build(BuildContext context) {
    final x = radius * cos(angle);
    final y = radius * sin(angle);

    if (angle.abs() > (pi / 2) && angle.abs() < (pi * 1.5)) {
      return new Transform(
        transform: new Matrix4.translationValues(x, y, 0.0),
        child: child,);
    } else if (angle.abs() <= (pi / 2)) {
      final x = radius * cos(pi / 2);
      final y = radius * sin(pi / 2);
      return Transform(
        transform: new Matrix4.translationValues(x, y, 0.0),
        child: child,);
    } else {
      final x = radius * cos((pi * 1.5));
      final y = radius * sin((pi * 1.5));
      return Transform(
        transform: new Matrix4.translationValues(x, y, 0.0),
        child: child,);
    }
  }
}