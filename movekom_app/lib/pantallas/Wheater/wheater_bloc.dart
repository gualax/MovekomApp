import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movekomapp/pantallas/Wheater/whather_data_model.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_repository.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class FetchWeather extends WeatherEvent {
  final String city;
  final int indexDay;

   FetchWeather({@required this.city,@required this.indexDay}) : assert(city != null);

  @override
  List<Object> get props => [city,indexDay];
}

class FetchWeatherListLatLong extends WeatherEvent {
  final double lat;
  final double long;

  FetchWeatherListLatLong({@required this.lat,this.long}) : assert(lat != null);

  @override
  List<Object> get props => [lat,long];
}

class FetchWeatherLatLong extends WeatherEvent {
  final double lat;
  final double long;
  final int indexDay;

  FetchWeatherLatLong({@required this.lat,@required this.long,@required this.indexDay}) : assert(lat != null);

  @override
  List<Object> get props => [lat,long,indexDay];
}

class RefreshWeather extends WeatherEvent {
  final String city;
  final int indexDay;

   RefreshWeather({@required this.city,@required this.indexDay}) : assert(city != null);

  @override
  List<Object> get props => [city,indexDay];
}

class FetchWeatherList extends WeatherEvent {
  final String city;

  FetchWeatherList({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class RefreshWeatherList extends WeatherEvent {
  final String city;

  RefreshWeatherList({@required this.city}) : assert(city != null);
  @override
  List<Object> get props => [city];
}

abstract class WeatherState extends Equatable {
   WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

   WeatherLoaded({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoadedList extends WeatherState {
  final List<Weather> weatherList;

  WeatherLoadedList({@required this.weatherList}) : assert(weatherList != null);

  @override
  List<Object> get props => [weatherList];
}

class WeatherError extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if (event is FetchWeatherList) {
      yield* _mapFetchWeatherListToState(event);
    } else if (event is RefreshWeatherList) {
      yield* _mapRefreshWeatherListToState(event);
    } else if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    } else if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState(event);
    }else if (event is FetchWeatherLatLong){
      yield* _mapFetchWeatherLatLongToState(event);
    }else if(event is FetchWeatherListLatLong){
      yield* _mapFetchWeatherListLatLongToState(event);
    }
  }

  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield WeatherLoading();
    try {
      final Weather weather = await weatherRepository.getWeather(event.city, event.indexDay);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield WeatherError();
    }
  }

  Stream<WeatherState> _mapRefreshWeatherToState(RefreshWeather event) async* {
    try {
      final Weather weather = await weatherRepository.getWeather(event.city,event.indexDay);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield state;
    }
  }


  Stream<WeatherState> _mapRefreshWeatherListToState(RefreshWeatherList event) async* {
    try {
      final List<Weather> weatherList = await weatherRepository.getWeatherList(event.city);
      yield WeatherLoadedList(weatherList: weatherList);
    } catch (_) {
      yield state;
    }
  }


  Stream<WeatherState> _mapFetchWeatherListToState(FetchWeatherList event) async* {
    yield WeatherLoading();
    try {
      final List<Weather> weatherList = await weatherRepository.getWeatherList(event.city);
      yield WeatherLoadedList(weatherList: weatherList);
    } catch (_) {
      yield WeatherError();
    }
  }



  Stream<WeatherState> _mapFetchWeatherLatLongToState(FetchWeatherLatLong event) async* {
    yield WeatherLoading();
    try {
      final Weather weather = await weatherRepository.getWeatherLatLong(event.lat,event.long, event.indexDay);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield WeatherError();
    }
  }

  Stream<WeatherState> _mapFetchWeatherListLatLongToState(FetchWeatherListLatLong event) async* {
    yield WeatherLoading();
    try {
      final List<Weather> weatherList = await weatherRepository.getWeatherListLatLong(event.lat,event.long);
      yield WeatherLoadedList(weatherList: weatherList);
    } catch (_) {
      yield WeatherError();
    }
  }

}
