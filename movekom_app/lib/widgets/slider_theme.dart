

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';

SliderThemeData sliderCustomTheme(context){
  return
      SliderTheme.of(context).copyWith(
      inactiveTrackColor: Colors.grey,
      activeTrackColor: Colors.yellow,
      trackShape: RectangularSliderTrackShape(),
      trackHeight: SC.all(10),
      thumbColor: Colors.lightGreenAccent,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius:SC.all(13)),
      overlayColor: Colors.green.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: SC.all(10)),
  );
}