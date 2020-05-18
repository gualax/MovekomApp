
import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;
  final String aplicableDate;


  Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
    this.aplicableDate,
  }) : super([
    condition,
    formattedCondition,
    minTemp,
    temp,
    maxTemp,
    locationId,
    created,
    lastUpdated,
    location,
    aplicableDate,
  ]);

  static Weather fromJson(dynamic json, int indexDay) {
    final consolidatedWeather = json['consolidated_weather'][indexDay];
    return Weather(
      condition: _mapStringToWeatherCondition(
          consolidatedWeather['weather_state_abbr']),
      formattedCondition: consolidatedWeather['weather_state_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      location: json['title'],
      aplicableDate: consolidatedWeather['applicable_date'],
    );
  }

  static List<Weather> fromJsonToArray(dynamic json) {
    print("fromJsonToArray");
    print(json);
    List<Weather> _weatherList = new List();
    final consolidatedWeather = json['consolidated_weather'];
    for (var i in consolidatedWeather) {
      _weatherList.add(Weather(
        condition: _mapStringToWeatherCondition(
            i['weather_state_abbr']),
        formattedCondition: i['weather_state_name'],
        minTemp: i['min_temp'] as double,
        temp: i['the_temp'] as double,
        maxTemp: i['max_temp'] as double,
        locationId: json['woeid'] as int,
        created: i['created'],
        lastUpdated: DateTime.now(),
        location: json['title'],
        aplicableDate: i['applicable_date'],
      ));
    }
    print("_weatherList");
    print(_weatherList);
    return _weatherList;
  }



  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}