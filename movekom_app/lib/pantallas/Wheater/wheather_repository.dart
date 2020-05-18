import 'package:meta/meta.dart';
import 'package:movekomapp/pantallas/Wheater/whater_api_client.dart';
import 'package:movekomapp/pantallas/Wheater/whather_data_model.dart';


class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city,int indexDay) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId,indexDay);
  }

  Future<List<Weather>> getWeatherList(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeatherList(locationId);
  }
}
