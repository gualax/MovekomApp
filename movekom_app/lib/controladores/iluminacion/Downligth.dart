
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/dowligth_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';


class Downligth extends StatelessWidget {
  final String title = "Downlight";
  final int widgetType;
  DownligthBloc downlightBloc;
  Downligth(this.widgetType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
      return dowligth_chico();
    }else {
      return dowligth_grande();
    }
  }

  Widget dowligth_grande(){
    return
      BlocBuilder<DownligthBloc,DownligthState>(
          builder: ( context, state) {
            downlightBloc = BlocProvider.of<DownligthBloc>(context);
          return Container(
            margin: EdgeInsets.all(SizeConfig.h * 0.5),
            width: SizeConfig.h * 17,
            height: SizeConfig.v * 19,
            decoration: new BoxDecoration(
                color: Color(0xff2d3033)
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  right: SizeConfig.h * 3.5, bottom: SizeConfig.v * 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/tira_led.svg", Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 75),
                  ),
                ),
                Positioned.fill(
                  left: SizeConfig.h * 3.5, bottom: SizeConfig.v * 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 45),
                  ),
                ),
                Positioned.fill(
                  bottom:  SizeConfig.v * 0.7,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:  SizeConfig.v * 3.2,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.white,
                          trackShape: RectangularSliderTrackShape(),
                          trackHeight:  SizeConfig.v * 1,
                          thumbColor: Colors.lightGreenAccent,
                          overlayColor: Colors.green.withAlpha(32),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: SizeConfig.p * 1.5),
                        ),
                        child: Slider(
                          value: state.valueDimer,
                          onChanged: (newValue) {
                            //   print(newValue);
                            downlightBloc.add(Update(newValue));
                          },
                          min: 0,
                          max: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: SizeConfig.v * 0.5,
                  start: SizeConfig.h * 1,
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: MyTextStyle.estiloBold(SizeConfig.v * 2.6, Colors.white),
                                text: title),
                          ]
                      )
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


  Widget dowligth_chico(){
    Color color;
    String text;
    return
      BlocBuilder<DownligthBloc,DownligthState>(
          builder: ( context, state) {
            downlightBloc = BlocProvider.of<DownligthBloc>(context);
            if(state.isEnabled ){
              color = Colors.lightGreen;
              text = "ON";
            }else {
              color = Colors.grey;
              text = "OFF";
            }
            return GestureDetector(
              onTap: (){
                if(state.isEnabled){
                  downlightBloc.add(Disable());
                }else{
                  downlightBloc.add(Enable());
                }
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 66,
                height: 137,
                decoration: new BoxDecoration(
                  color: MyColors.ContainerColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("DOWN", style: MyTextStyle.estiloBold(15, color),),
                        )
                    ),Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/tira_led.svg", color, 45),
                        )
                    ),Positioned.fill(
                        bottom: 8,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:   RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: MyTextStyle.estiloBold(20,color),
                                        text: text ),
                                  ]
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          }
      );
  }


} /// Fin clase
