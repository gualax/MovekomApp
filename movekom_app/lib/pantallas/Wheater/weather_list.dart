import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/pantallas/Wheater/whather_data_model.dart';
import 'package:movekomapp/pantallas/Wheater/wheater_bloc.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_conditions.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WeatherListWidget extends StatefulWidget {
  String locationCity;
  WeatherListWidget(this.locationCity);

  @override
  _WeatherListWidgetState createState() => _WeatherListWidgetState();
}

class _WeatherListWidgetState extends State<WeatherListWidget> {
  WeatherBloc _weatherBloc;
  String _currentLocality = "";
  String _currentCountry = "";
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return cabeceraYlista();
  }


  Widget cabeceraYlista(){
    return Column(
      children: <Widget>[
        cabeceraClimas(),
        RowOfWheaterWidgets(),
      ],
    );
  }


  Widget RowOfWheaterWidgets() {
    return
      BlocBuilder<WeatherBloc,WeatherState>(
    builder: (context, state) {
      print(state);
    if (state is WeatherEmpty) {
        return Center(child: Text('Please Select a Location'));
        }else if (state is WeatherLoading) {
        return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadedList) {
        final weatherList = state.weatherList;
        print("weatherList");
        print(weatherList);
    return Container(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        /// ver por que solo muestra el utlimo llamado, ver forma desde el el parsing de convertir esto en un array =)
        children: <Widget>[
          weatherBoxi(weatherList[0]),
          weatherBoxi(weatherList[1]),
          weatherBoxi(weatherList[2]),
          weatherBoxi(weatherList[3]),
          weatherBoxi(weatherList[4]),
          weatherBoxi(weatherList[5]),
        ],
      ),
    );
    } else {
      return Text(
        'Something went wrong!',
        style: TextStyle(color: Colors.red),);
    }
    }
    );
  }


  Widget weatherBoxi(Weather weather){
    return Container(
      width: 170,
      height: 125,
      margin: EdgeInsets.only(left: 1, right: 1),
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill( /// DAY
              top: 7,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  DateFormat('EEEE').format(DateTime.parse(weather.aplicableDate))
                  , style: MyTextStyle.estiloBold(18, Colors.white),),
              )
          ),
          Positioned.fill(/// ICON
            child: Align(
              alignment: Alignment.center,
              child:  WeatherConditions(condition: weather.condition), /// icon weather
            ),
          ),
          Positioned.fill(/// tMIN
            bottom: 5,
            left: 5,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Min: " + weather.minTemp.toStringAsFixed(1), style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
          Positioned.fill( /// tMax
            bottom: 5,
            right: 5,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Max: " + weather.maxTemp.toStringAsFixed(1), style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //  _weatherBloc.close();
    super.dispose();
  }

  Widget cabeceraClimas(){
    return Container(
      margin: EdgeInsets.only(top:5),
      height: 30,
      width: SizeConfig.x(80.5),
      decoration: new BoxDecoration(
          color: MyColors.baseColor
      ),
      child: Align(
            alignment: Alignment.centerLeft,
            child: Text("  Pronostico extendido de : " + _currentLocality ,
            style: MyTextStyle.estiloBold(15, Colors.white),
      ),
      ),
    );
  }


  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position);
      getAddressFromLatLng(position);
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = p[0];
      print(place.locality);
      print(place.toString());
      print(place.toJson());
      setState(() {
        _currentLocality = place.administrativeArea;
        _currentCountry = place.country;
        _weatherBloc.add(FetchWeatherList(city: place.administrativeArea));
      });
    } catch (e) {
      print(e);
    }
  }


}
