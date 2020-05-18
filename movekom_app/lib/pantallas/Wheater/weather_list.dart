import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
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

  @override
  Widget build(BuildContext context) {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    _weatherBloc.add(FetchWeatherList(city: widget.locationCity));
    return RowOfWheaterWidgets();
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
      height: 150,
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
      width: 160,
      height: 115,
      margin: EdgeInsets.only(left: 1, right: 1),
      decoration: new BoxDecoration(
        color: MyColors.ContainerColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill( /// DAY
              top: 5,
              left: 7,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  weather.aplicableDate, style: MyTextStyle.estiloBold(15, Colors.white),),
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
                "Min: " + weather.minTemp.toStringAsFixed(2), style: MyTextStyle.estilo(12, Colors.white),),
            ),
          ),
          Positioned.fill( /// tMax
            bottom: 5,
            right: 5,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Max: " + weather.maxTemp.toStringAsFixed(2), style: MyTextStyle.estilo(12, Colors.white),),
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

}
