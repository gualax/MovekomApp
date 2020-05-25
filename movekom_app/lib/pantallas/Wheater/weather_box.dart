

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/pantallas/Wheater/wheater_bloc.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_conditions.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WeatherBox extends StatefulWidget {
  String locationCity;
  int indexDay;
  WeatherBox(this.locationCity,this.indexDay);
  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  WeatherBloc _weatherBloc;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return WheaterWidget();
  }


  Widget WheaterWidget(){
  return
    BlocBuilder<WeatherBloc,WeatherState>(
      builder: (context, state) {
    if (state is WeatherEmpty) {
    return Center(child: Text('Please Select a Location'));
    }else if (state is WeatherLoading) {
    return Center(child: boxWithIndicator());
    } else if (state is WeatherLoaded) {
      final weather = state.weather;
      return Container(
        width: 140,
        height: 135,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill( /// DAY
                top: 9,
                left: 7,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                   "Hoy", style: MyTextStyle.estiloBold(22, Colors.white),),
                )
            ),
            Positioned.fill(/// ICON
            //  right: 13, bottom: 10,
              child: Align(
                alignment: Alignment.center,
                child:  WeatherConditions(condition: weather.condition), /// icon weather
              ),
            ),
            Positioned.fill(/// TEMP
           //   left:10,  bottom: 10,
              top: 5, right: 5,
              child: Align(
                alignment: Alignment.topRight,
                child:  Text(
                  weather.temp.toStringAsFixed(1) + "º", style: MyTextStyle.estiloBold(27, Colors.white),), /// icon weather
              ),
            ),
            Positioned.fill(/// tMIN
              bottom: 5,
              left: 5,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Min: " + weather.minTemp.toStringAsFixed(1), style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
            Positioned.fill(/// location
              top: 70,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  weather.location, style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
            Positioned.fill( /// tMax
              bottom: 5,
              right: 5,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Max: " + weather.maxTemp.toStringAsFixed(1), style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
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

  @override
  void dispose() {
  //  _weatherBloc.close();
    super.dispose();
  }

Widget boxWithIndicator(){
  return Container(
      width: 140,
      height: 135,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: new BoxDecoration(
     color: MyColors.baseColor,
      ),
    child: Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator() ,
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
      setState(() {
        _currentAddress = place.administrativeArea;
        _weatherBloc.add(FetchWeather(city: place.administrativeArea,indexDay: widget.indexDay));
      });
    } catch (e) {
      print(e);
    }
  }



}