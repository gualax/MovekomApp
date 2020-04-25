import 'package:flutter/material.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/app.localizations.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class BateriaMotor extends StatefulWidget {
  bool isEnabled;
  double valueBat;
  int widgetType;

  BateriaMotor(this.widgetType,this.isEnabled,this.valueBat);

  @override
  _BateriaMotorState createState() => _BateriaMotorState();
}

class _BateriaMotorState extends State<BateriaMotor> {

  String _title;
  bool _isEnabled;
  double _valueBat;
  double _valueAmp;
  double _valueVolt;
  Color color;
  Color colorText;
  Color iconColor;
  String on_off_Text;

  @override
  void initState() {
      super.initState();
      _isEnabled = widget.isEnabled;
      _valueBat = widget.valueBat;
      _valueAmp = 20.2;
      _valueVolt = 20.2;
  }

  @override
  Widget build(BuildContext context) {

    _title = AppLocalizations.of(context).translate("bateria motor");
    if(_isEnabled){
      color = Colors.lightGreen;
      colorText = Colors.white;
      iconColor = color;
      on_off_Text = "Pulsar para apagar bateria";
    }else{
      color = Colors.grey;
      colorText = Colors.grey;
      iconColor = Colors.white;
      on_off_Text = "Pulsar para encender bateria";
    }
    if(widget.widgetType == 1){
      return bateria_motor_chico();
    } else{
      return bateria_motor_grande();
    }
  }

/// 1
  Widget bateria_motor_chico() {
    return
      Container(
          margin: EdgeInsets.all(7),
          width: 137, height: 137,
          decoration: new BoxDecoration(
              color: Color(0xff2d3033)
          ),
          child: Stack(
              children: [
                Positioned.fill( /// valor bateria
                  left: 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: circleIndicatorBatery(_valueBat, color),
                  ),
                ),
                Positioned.fill(    /// titulo
                top: 4,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(_title,
                    style: MyTextStyle.estiloBold(15, color),),
                  ),
                ),
                PositionedDirectional(
                  bottom: 4, start: 10,
                  child: Text(
                      _valueVolt.toString()+ "V" ,
                      style: MyTextStyle.estilo(15, color),
                      textAlign: TextAlign.center
                  ),
                ),
                PositionedDirectional( ///valueAmp
                    bottom: 4, end: 10,
                    child: Text(
                        _valueAmp.toString()+ "A",
                        style: MyTextStyle.estilo(15, color),
                        textAlign: TextAlign.center
                    )
                )
              ])
      );
  }


  Widget circleIndicatorBatery(value,color){
    return Container (
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          circulito(42.0,color),
          circleIndicator(value, color)
        ],
      ),
    );
  }



  /// 2
  Widget bateria_motor_grande(){
    return
      Container(
          margin: EdgeInsets.all(5),
          width: 200,
          height: 214,
          decoration: new BoxDecoration(
              color: Color(0xff2d3033)
          ), child: Stack(
          children: [
            Positioned.fill(   /// valor bateria
              right: 20,
              child:   Align(
                alignment: Alignment.centerRight,
                child: circleIndicatorBatery(_valueBat,color),
              ),
            ),
            Positioned.fill(  /// titulo
              top: 4,
              left: 10,
              child:   Align(
                alignment: Alignment.topLeft,
                child:Text(_title,
                  style:MyTextStyle.estiloBold(20, colorText),
                ),
              ),
            ),
            Positioned.fill( /// valueVolt
              left: 7,
              bottom: 30,
              child:   Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    _valueVolt.toString() + "V",
                    style: MyTextStyle.estiloBold(16, colorText),
                    textAlign: TextAlign.center
                ),
              ),
            ),
            Positioned.fill(  ///  /// valueAmp
                top:30,
                left: 7,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      _valueAmp.toString() + "A",
                      style: MyTextStyle.estiloBold(16, colorText),
                      textAlign: TextAlign.center
                  ),
                )
            ),
            Positioned.fill(  ///  /// valueAmp
                bottom:20,
                left: 30,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      on_off_Text,
                      style: MyTextStyle.estiloBold(12, colorText),
                      textAlign: TextAlign.center
                  ),
                )
            ),
            Positioned.fill(
                right: 170, bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: Icon(Icons.power_settings_new), iconSize: 30,
                    color: iconColor, onPressed: () {
                    setState(() {

                      if(_isEnabled){
                        _valueBat = 0.0;
                        _isEnabled = false;
                      }else{
                    //    _valueBat = widget.valueBat;
                        _isEnabled = true;
                      }

                    });
                  },),
                )
            )
          ])
      );
  }

  Widget circleIndicator(value, color){
    return CircularPercentIndicator(
      radius: 78.0,
      lineWidth: 8,
      percent: (value)/100,
      center: new Text((value).toString() +"%",
        style: MyTextStyle.estiloBold(20, Colors.white),),
      progressColor: color,
      backgroundColor: MyColors.ContainerColor,
    );
  }

}//fin de clase