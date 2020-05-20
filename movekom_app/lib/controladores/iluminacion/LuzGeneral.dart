
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luz_general_bloc.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LuzGeneral extends StatelessWidget {
  final String title = "Luz general ";
  final int widgetType;
  LuzGeneralBloc luzGeneralBloc;
  LuzGeneral(this.widgetType);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
      return luz_general_chico();
    }else{
      return luz_general_grande();
    }
  }

  Widget luz_general_grande(){
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
            luzGeneralBloc = BlocProvider.of<LuzGeneralBloc>(context);
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
                  right: SizeConfig.h * 3.5, bottom: SizeConfig.v * 0.5,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/todas_luces.svg", Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 65),
                  ),
                ),
                Positioned.fill(
                  left: SizeConfig.h * 3.5, bottom: SizeConfig.v * 0.5,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.lightGreenAccent.withAlpha(state.valueDimer.round() + 20), 40),
                  ),
                ),
                Positioned.fill(
                  bottom:  SizeConfig.v * 0.7,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:  SizeConfig.v * 3.2,
                      child: SliderTheme(
                        data: sliderCustomTheme(context),
                        child: Slider(
                          value: state.valueDimer,
                          onChanged: (newValue) {
                            //   print(newValue);
                            luzGeneralBloc.add(Update(newValue));
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



  Widget luz_general_chico(){
    Color color;
    String text;
    return
      BlocBuilder<LuzGeneralBloc,LuzGeneralState>(
          builder: ( context, state) {
            luzGeneralBloc = BlocProvider.of<LuzGeneralBloc>(context);
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
                  luzGeneralBloc.add(Disable());
                }else{
                  luzGeneralBloc.add(Enable());
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
                          child: iconSvgD("assets/icons/luz.svg", color, 35),
                        )
                    ),Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/todas_luces.svg", color, 35),
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
