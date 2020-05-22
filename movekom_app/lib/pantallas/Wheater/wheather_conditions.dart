import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:movekomapp/pantallas/Wheater/whather_data_model.dart';
import 'package:movekomapp/widgets/IconSvg.dart';


class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Widget _mapConditionToImage(WeatherCondition condition) {
    Widget image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = iconSvgD("assets/icons/clima_sol.svg", Colors.white,45.0);
      break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
      image = iconSvgD("assets/icons/clima_granizo.svg", Colors.white,45.0);
        break;
      case WeatherCondition.heavyCloud:
        image = iconSvgD("assets/icons/clima_nubes.svg", Colors.white,35.0);
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
      image = iconSvgD("assets/icons/clima_lluvia.svg", Colors.white,45.0);
        break;
      case WeatherCondition.thunderstorm:
        image = iconSvgD("assets/icons/clima_tormenta.svg", Colors.white,45.0);
        break;
      case WeatherCondition.unknown:
        image = iconSvgD("assets/icons/clima_sol.svg", Colors.white,45.0);
        break;
    }
    return image;
  }
}