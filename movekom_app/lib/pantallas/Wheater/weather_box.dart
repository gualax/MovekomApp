

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/pantallas/Wheater/wheater_bloc.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_conditions.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';

class WeatherBox extends StatefulWidget {
  int indexDay;
  int widgetType;
  WeatherBox(this.indexDay,this.widgetType);
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
    print(" *** initState ***");
  }


  @override
  Widget build(BuildContext context) {
    print(" *** build ***");
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    if (widget.widgetType == 1) {
      return _wheater();
    } else {
      return wheater_widget();
    }

  }


  Widget _wheater(){
  return
    BlocBuilder<WeatherBloc,WeatherState>(
      builder: (context, state) {
    if (state is WeatherEmpty) {
       return wheaterBoxLoading();
    }else if (state is WeatherLoading) {
       return wheaterBoxLoading();
    } else if (state is WeatherLoaded) {
      final weather = state.weather;
       return wheaterBoxLoaded(weather);
    } else {
      return wheaterBoxError();
       }
      }
    );
  }

  @override
  void dispose() {
   // _weatherBloc.close();
    super.dispose();
  }

Widget wheaterBoxLoaded(weather){
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
  }

Widget wheaterBoxLoading(){
  return MyContainer(
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
               // child: CircularProgressIndicator() , /// icon weather
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

Widget wheaterBoxError(){
    return MyContainer(
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
              left: 20, right: 20,
              child: Align(
                alignment: Alignment.center,
                child: Text("--",
                style: MyTextStyle.estilo(16, MyColors.text),textAlign: TextAlign.center,) , /// icon weather
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
      if(_currentPosition != position){
        _currentPosition = position;
        getAddressFromLatLng(position);
      }
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      print(position.latitude);
      print(position.longitude);
      Placemark place = p[0];
      print(Placemark);
      setState(() {
        _currentAddress = place.administrativeArea;
        _weatherBloc.add(FetchWeatherLatLong(lat: position.latitude,long: position.longitude,indexDay: widget.indexDay));
      });
    } catch (e) {
      print(e);
    }
  }



  Widget wheater_widget(){
    return MyContainer(
      width: 225,
      height: 140,
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
                  "El tiempo hoy" , style: MyTextStyle.estilo(18, Colors.white),),
              )
          ),
          MyPositioned.fill(/// ICON
            child: Align(
              alignment: Alignment.center,
              child:  iconSvgD("assets/icons/clima_sol.svg", Colors.white,45.0), /// icon weather
            ),
          ),

        ],
      ),
    );
  }



}