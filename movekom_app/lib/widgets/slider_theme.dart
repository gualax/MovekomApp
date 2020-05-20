

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';

SliderThemeData sliderCustomTheme(context){
  return
      SliderTheme.of(context).copyWith(
      inactiveTrackColor: Colors.grey,
      activeTrackColor: Colors.yellow,
      trackShape: RectangularSliderTrackShape(),
      trackHeight:  SizeConfig.v * 1,
      thumbColor: Colors.lightGreenAccent,
      overlayColor: Colors.green.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: SizeConfig.p * 1.5),
  );
}