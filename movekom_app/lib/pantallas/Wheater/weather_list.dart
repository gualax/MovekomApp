import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/pantallas/Wheater/whather_data_model.dart';
import 'package:movekomapp/pantallas/Wheater/wheater_bloc.dart';
import 'package:movekomapp/pantallas/Wheater/wheather_conditions.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
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
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return cabeceraYlista();
  }


  Widget cabeceraYlista(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center ,
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
        return Center(child: loadingWheaterBoxes());
        }else if (state is WeatherLoading) {
        return Center(child: loadingWheaterBoxes());
        } else if (state is WeatherLoadedList) {
        final weatherList = state.weatherList;
        print("weatherList");
        print(weatherList);
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        /// ver por que solo muestra el utlimo llamado, ver forma desde el el parsing de convertir esto en un array =)
        children: <Widget>[
          weatherBoxi(weatherList[0]),
          weatherBoxi(weatherList[1]),
          weatherBoxi(weatherList[2]),
          weatherBoxi(weatherList[3]),
          weatherBoxi(weatherList[4]),
          weatherBoxi(weatherList[5]),
        ],
    );
    } else {
      return errorWheaterBoxes();
    }
    }
    );
  }


  Widget weatherBoxi(Weather weather){
    return MyContainer(
      margin: EdgeInsets.only(left:SC.left(2), right: SC.right(2)),
      width: 170,
      height: 105,
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill( /// DAY
              top: 7,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  DateFormat('EEEE').format(DateTime.parse(weather.aplicableDate))
                  , style: MyTextStyle.estiloBold(18, Colors.white),),
              )
          ),
          MyPositioned.fill(/// ICON
            child: Align(
              alignment: Alignment.center,
              child:  WeatherConditions(condition: weather.condition), /// icon weather
            ),
          ),
          MyPositioned.fill(/// tMIN
            bottom: 5,
            left: 5,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Min: " + weather.minTemp.toStringAsFixed(1), style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
          MyPositioned.fill( /// tMax
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




Widget loadingWheaterBoxes(){

  return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        weatherBoxiLoading(),
        weatherBoxiLoading(),
        weatherBoxiLoading(),
        weatherBoxiLoading(),
        weatherBoxiLoading(),
        weatherBoxiLoading(),
      ],
  );
}

  Widget weatherBoxiLoading(){
    return MyContainer(
      width: 170,
      height: 105,
      margin: EdgeInsets.only(left:SC.left(1), right: SC.right(1)),
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill( /// DAY
              top: 7,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text( "--"
                  , style: MyTextStyle.estiloBold(18, Colors.white),),
              )
          ),
          MyPositioned.fill( /// DAY
              child: Align(
                alignment: Alignment.center,
             //   child: CircularProgressIndicator(),
              )
          ),
          MyPositioned.fill(/// ICON
            child: Align(
              alignment: Alignment.center,
              child:  Text("--",
                style: MyTextStyle.estilo(15, Colors.white),), /// icon weather
            ),
          ),
          MyPositioned.fill(/// tMIN
            bottom: 5,
            left: 5,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Min: " + "--", style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
          MyPositioned.fill( /// tMax
            bottom: 5,
            right: 5,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Max: " + "--", style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
        ],
      ),
    );
  }


  Widget errorWheaterBoxes(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      /// ver por que solo muestra el utlimo llamado, ver forma desde el el parsing de convertir esto en un array =)
      children: <Widget>[
        weatherBoxiError(),
        weatherBoxiError(),
        weatherBoxiError(),
        weatherBoxiError(),
        weatherBoxiError(),
        weatherBoxiError(),
      ],
    );
  }


  Widget weatherBoxiError(){
    return MyContainer(
      width: 170,
      height: 105,
      margin: EdgeInsets.only(left:SC.left(1), right: SC.right(1)),
      decoration: new BoxDecoration(
        color: MyColors.baseColor,
      ),
      child: Stack(
        children: <Widget>[
          MyPositioned.fill( /// DAY
              top: 7,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text( "--"
                  , style: MyTextStyle.estiloBold(18, Colors.white),),
              )
          ),
          MyPositioned.fill( /// DAY
              left: 20, right: 20,
              child: Align(
                alignment: Alignment.center,
                child: Text("Problema de conexion",
                  style: MyTextStyle.estilo(14, MyColors.text),textAlign: TextAlign.center,) , /// icon weather
              )
          ),
          MyPositioned.fill(/// ICON
            child: Align(
              alignment: Alignment.center,
              child:  Text("--",
                style: MyTextStyle.estilo(15, Colors.white),), /// icon weather
            ),
          ),
          MyPositioned.fill(/// tMIN
            bottom: 5,
            left: 5,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Min: " + "--", style: MyTextStyle.estilo(15, Colors.white),),
            ),
          ),
          MyPositioned.fill( /// tMax
            bottom: 5,
            right: 5,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Max: " + "--", style: MyTextStyle.estilo(15, Colors.white),),
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
    return MyContainer(
      margin: EdgeInsets.all(SC.all(5)),
      height: 30,
      width: 1040,
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
      print(place);
      print(place.toJson());
      setState(() {
        if(place.administrativeArea != null) {
          _currentLocality = place.administrativeArea;
        } else if (place.locality != null ) {
          _currentLocality = place.locality;
        }else {
          _currentLocality = place.country;
        }
        _weatherBloc.add(FetchWeatherListLatLong(lat:position.latitude,long: position.longitude ));
      });
    } catch (e) {
      print(e);
    }
  }


}
