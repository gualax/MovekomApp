
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/blocs/bateria_motor_bloc.dart';
import 'package:movekomapp/controladores/electricidad/BateriaMotor.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class ElectricityStateView extends StatefulWidget {
  @override
  _ElectricityStateViewState createState() => _ElectricityStateViewState();
}

class _ElectricityStateViewState extends State<ElectricityStateView> {

  @override
  Widget build(BuildContext context) {
    final bateriaMotorBloc = BlocProvider.of<BateriaMotorBloc>(context);


    return BlocProvider<BateriaMotorBloc>(
      builder: (context) => BateriaMotorBloc(),
      child: Container(
        alignment: Alignment.center,
      child: Row(
        children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 13),
             //   color: Colors.lightGreen,
                alignment: Alignment.center,
             //  color: Colors.orange,
                child: baterias_cargadores(bateriaMotorBloc),
              ),
            ),
            Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20),
           //   color: Colors.blue,
              alignment: Alignment.center,
         //    color: Colors.blue,
              child: inversores_cargadores(),
             ),
            )
      ],
      ),
      ),
    );
  }

  Widget baterias_cargadores(bateriaMotorBloc){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row1(bateriaMotorBloc),
        Row2(),
      ],
    );
  }

  Widget inversores_cargadores(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InversorCargador("Inversor",21,true),
        InversorCargador("Cargador de baterias",20,false),
      ],
    );
  }
  Widget Row1(bateriaMotorBloc) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder(
            bloc: bateriaMotorBloc,
            builder: (BuildContext context, BateriaMotorState state) {
              return BateriaMotor(2,state.isEnabled, state.valueBat);
            },
          ),
          bateryBox("Bateria auxiliar 1", 70, 12.45, 23.5, true),
          bateryBox("Bateria auxiliar 2", 50, 12.45, 23.5, true),
          totalizador(),
        ],
      ),
    );
  }

  Widget Row2() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chargeBox("Carga de motor","assets/icons/engine_motor_car_power.svg",50,23.65),
          chargeBox("Carga de 220","assets/icons/energy_2.svg",50,23.65),
          chargeBox("Carga de panel solar","assets/icons/solar_panel_1.svg",50,23.65),
          chargeBox("Consumo instantaneo","assets/icons/electricidad.svg",50,23.65),
        ],
      ),
    );
  }


  Widget chargeBox(title, iconRoute,ampValue,totValue) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      height: 214,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033)
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            top: 10,
            right: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: iconSvgD(iconRoute, Colors.white, 35),
            ),
          ),
          Positioned.fill(
            top: 10,
            left: 10,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: MyTextStyle.estiloBold(15, Colors.white)),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  ampValue.toString(), style: MyTextStyle.estiloBold(40, Colors.white)),
            ),
          ),
          Positioned.fill(
            top:55,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "Ah", style: MyTextStyle.estiloBold(25, Colors.white)),
            ),
          ),
          Positioned.fill(
            bottom:10,
            right: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                  "Totalizador", style: MyTextStyle.estilo(15, Colors.white)),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            right: 20,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                  totValue.toString() + "A", style: MyTextStyle.estilo(15, Colors.white)),
            ),
          )
        ],
      ),
    );
  }



  Widget totalizador(){
    return Container(
      margin: EdgeInsets.all(5),
    width: 200,
    height: 214,
    decoration: new BoxDecoration(
    color: Color(0xff2d3033)
    ),
    child: Stack(
      children: <Widget>[
        Positioned.fill(
          top:80,
          right: 40,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                "Ah", style: MyTextStyle.estiloBold(25, Colors.white)),
          ),
        ),
        Positioned.fill(
          top:5,
          left: 10,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
                "Totalizador", style: MyTextStyle.estiloBold(20, Colors.white)),
          ),
        ),
        Positioned.fill(
          left: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: iconSvgD("assets/icons/electricidad.svg",Colors.orange,100),
          ),
        ),
        Positioned.fill(
          right: 10,
          bottom: 10,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                "40", style: MyTextStyle.estiloBold(80, Colors.white)),
          ),
        ),
        Positioned.fill(
          bottom:25,
          child: Align(
            alignment: Alignment.bottomCenter,
            child:Text(
                "Nº ciclos de AUX 1", style: MyTextStyle.estilo(15, Colors.white)),
          ),
        ),
        Positioned.fill(
          bottom:5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child:Text(
                "Nº ciclos de AUX 2", style: MyTextStyle.estilo(15, Colors.white)),
          ),
        ),
      ],
    ),
    );
  }

}



class InversorCargador extends StatefulWidget {
  final String title;
  int valueAmp;
  bool state;
  InversorCargador(this.title, this.valueAmp, this.state);
  @override
  _InversorCargadorState createState() => _InversorCargadorState();
}

class _InversorCargadorState extends State<InversorCargador> {
  bool _state;
  int  _valueAmp;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
    _valueAmp = widget.valueAmp;
  }

  @override
  Widget build(BuildContext context) {
    return inversor_cargador(widget.title,_valueAmp,_state);
  }


  Widget inversor_cargador(title,int valueAmp, state){
    Color iconColor,colorTex, circleColor;
    String on_off_Text;
    if(_state){
      iconColor =  Colors.lightGreen;
      circleColor =  Colors.lightGreen;
      colorTex = Colors.white;
      on_off_Text = "Pulsar para apagar";
    }else{
      colorTex = Colors.grey;
      circleColor = Colors.grey;
      iconColor = Colors.white;
      on_off_Text = "Pulsar para encender";
    }
    return  Container(
      width: 350, height: 220,
      decoration: new BoxDecoration(
          color: Color(0xff2d3033),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              left: 10, top:10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(title,
                  style: MyTextStyle.estiloBold(20, colorTex) ,),
              )
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(valueAmp.toString(),
                  style: MyTextStyle.estiloBold(60, colorTex) ,),
              )
          ),
          Positioned.fill(
              left: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvgD("assets/icons/cable.svg", colorTex, 60),
              )
          ),
          Positioned.fill(  ///  /// valueAmp
              bottom:20, left: 60,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    on_off_Text,
                    style: MyTextStyle.estiloBold(12, colorTex),
                    textAlign: TextAlign.center
                ),
              )
          ),
          Positioned.fill(
              left: 15, bottom: 5,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(Icons.power_settings_new), iconSize: 30,
                  color: iconColor, onPressed: () {
                  setState(() {
                    if(_state){
                      _valueAmp = 0;
                      _state = false;
                    }else{
                      _valueAmp = widget.valueAmp;
                      _state = true;
                    }
                  });
                },),
              )
          ),
          Positioned.fill(  ///  /// valueAmp
              bottom:20, left: 250, right: 20,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    "Establecer temporizacion",
                    style: MyTextStyle.estiloBold(12, colorTex),
                    textAlign: TextAlign.center
                ),
              )
          ),
          Positioned.fill(  ///  /// valueAmp
              bottom:42, right: 38,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.access_time), iconSize: 30,
                  color: colorTex, onPressed: () {
                },),
              )
          ),
          Positioned.fill(  ///  /// valueAmp
              top:20, right: 20,
              child: Align(
                alignment: Alignment.topRight,
                child: circuloConSombra(20.0, circleColor, state),
              )
          ),
        ],
      ),
    );
  }



}





class bateryBox extends StatefulWidget {

 final String title;
 double valueBatPercent;
 double valueVolt;
 double valueAmp;
 bool state;

 bateryBox(this.title,this.valueBatPercent,
 this.valueVolt, this.valueAmp, this.state);

  @override
  _bateryBoxState createState() => _bateryBoxState();
}

class _bateryBoxState extends State<bateryBox> {
  double _valueBatPercent;
  double _valueVolt;
  double _valueAmp;
  bool _state;
  @override
  void initState() {
    super.initState();
    _state = widget.state;
    _valueBatPercent = widget.valueBatPercent;
    _valueVolt = widget.valueVolt;
    _valueAmp = widget.valueAmp;
  }

  @override
  Widget build(BuildContext context) {
    return box200x215_bateria(widget.title,_valueBatPercent,_valueVolt,_valueAmp,_state);
  }
  Widget box200x215_bateria(title,double valueBat, valueVolt,valueAmp,state){
    Color color;
    Color colorText;
    Color iconColor;
    String on_off_Text;
    if(_state){
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
                child: circleIndicatorBatery(valueBat,color),
              ),
            ),
            Positioned.fill(  /// titulo
              top: 4,
              left: 10,
              child:   Align(
                alignment: Alignment.topLeft,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style:MyTextStyle.estiloBold(20, colorText),
                              text: title ),
                        ]
                    )
                ),
              ),
            ),
            Positioned.fill( /// valueVolt
              left: 7,
              bottom: 30,
              child:   Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    valueVolt.toString() + "V",
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
                      valueAmp.toString() + "A",
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
                right: 170,
                bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: Icon(Icons.power_settings_new), iconSize: 30,
                    color: iconColor, onPressed: () {
                    setState(() {
                      if(_state){
                        _valueBatPercent = 0.0;
                        _state = false;
                      }else{
                        _valueBatPercent = widget.valueBatPercent;
                        _state = true;
                      }
                    });
                  },),
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
          circulito(56.0,color),
          circleIndicator(value, color)
        ],
      ),
    );
  }

  Widget circleIndicator(value, color){
    return CircularPercentIndicator(
      radius: 105.0,
      lineWidth: 12,
      percent: (value)/100,
      center: new Text((value).toString() +"%",
        style: MyTextStyle.estiloBold(25, Colors.white),),
      progressColor: color,
      backgroundColor: MyColors.ContainerColor,
    );
  }

}
