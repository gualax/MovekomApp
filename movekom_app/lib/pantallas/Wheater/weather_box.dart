

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/pantallas/Wheater/wheater_bloc.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_conditions.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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
      return MyContainer(
        width: 380,
        height: 135,
        margin: EdgeInsets.all(SC.all(5)),
        decoration: new BoxDecoration(
          color: MyColors.baseColor,
        ),
        child: Stack(
          children: <Widget>[
            MyPositioned.fill( /// DAY
                top: 9, left: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                   "El tiempo hoy" , style: MyTextStyle.estilo(20, Colors.white),),
                )
            ),
            MyPositioned.fill(/// ICON
              left: 150,
              child: Align(
                alignment: Alignment.center,
                child:  WeatherConditions(condition: weather.condition), /// icon weather
              ),
            ),
            MyPositioned.fill(/// TEMP
              right: 150,
              child: Align(
                alignment: Alignment.center,
                child:  Text(
                  weather.temp.toStringAsFixed(1) + "º", style: MyTextStyle.estiloBold(40, Colors.white),), /// icon weather
              ),
            ),
            MyPositioned.fill(/// tMIN
              bottom: 10,
              left: 20,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Min: " + weather.minTemp.toStringAsFixed(1), style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
            MyPositioned.fill(/// location
              top: 90,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  weather.location, style: MyTextStyle.estilo(20, Colors.white),),
              ),
            ),
            MyPositioned.fill( /// tMax
              bottom: 10,
              right: 20,
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
    width: 380,
    height: 135,
    margin: EdgeInsets.all(SC.all(5)),
      decoration: new BoxDecoration(
     color: MyColors.baseColor,
      ),
      child: MyContainer(
        width: 50,
        height: 50,
      ///  child: CircularProgressIndicator() ,
        child:  Stack(
          children: <Widget>[
            MyPositioned.fill( /// DAY
                top: 9, left: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "El tiempo hoy" , style: MyTextStyle.estilo(20, Colors.white),),
                )
            ),
            MyPositioned.fill(/// ICON
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator() , /// icon weather
              ),
            ),
            MyPositioned.fill(/// ICON
              left: 150,
              child: Align(
                alignment: Alignment.center,
                child:  Text("--",
                  style:MyTextStyle.estilo(15, MyColors.text)), /// icon weather
              ),
            ),
            MyPositioned.fill(/// TEMP
              right: 150,
              child: Align(
                alignment: Alignment.center,
                child:  Text(
                  "---", style: MyTextStyle.estiloBold(40, Colors.white),), /// icon weather
              ),
            ),
            MyPositioned.fill(/// tMIN
              bottom: 10,
              left: 20,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Min: " + "--", style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
            MyPositioned.fill(/// location
              top: 90,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "--", style: MyTextStyle.estilo(20, Colors.white),),
              ),
            ),
            MyPositioned.fill( /// tMax
              bottom: 10,
              right: 20,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Max: " + "--", style: MyTextStyle.estilo(13, Colors.white),),
              ),
            ),
          ],
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
      setState(() {
        _currentAddress = place.administrativeArea;
        _weatherBloc.add(FetchWeather(city: "Madrid",indexDay: widget.indexDay));
      });
    } catch (e) {
      print(e);
    }
  }



}