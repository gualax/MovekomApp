
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';

SliderThemeData sliderCustomTheme(context){
  return
      SliderTheme.of(context).copyWith(
      inactiveTrackColor: Colors.grey,
      activeTrackColor: Colors.white,
      trackShape: RectangularSliderTrackShape(),
      trackHeight: SC.all(10),
      thumbColor: Colors.lightGreenAccent,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius:SC.all(15)),
      overlayColor: Colors.green.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: SC.all(10)),
  );
}