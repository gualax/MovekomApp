
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class Upligth extends StatelessWidget {
  final String title = "UPLIGHT";
  UpligthBloc uplightBloc;
  final int widgetType;

  Upligth(this.widgetType);
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widgetType == 1){
     return uplight_chico();
    }else {
     return uplight_grande();
    }
  }

  Widget uplight_grande(){
    return
      BlocBuilder<UpligthBloc,UplightState>(
        builder: ( context, state) {
          uplightBloc =  BlocProvider.of<UpligthBloc>(context);
          return MyContainer(
            margin: EdgeInsets.all(SC.all(5)),
            width: 240,
            height: 175,
            decoration: new BoxDecoration(
                color: MyColors.baseColor
            ),
            child: Stack(
              children: [
                MyPositioned.fill(
                  right: 40, bottom: 20,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/tira_led.svg", MyColors.principal.withAlpha(state.valueDimer.round() + 20), 85),
                  ),
                ),
                MyPositioned.fill(
                  left: 30, bottom: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  MyColors.principal.withAlpha(state.valueDimer.round() + 20), 55),
                  ),
                ),
                MyPositioned.fill(
                  bottom:  10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:  SC.hei(20),
                      child: SliderTheme(
                        data: sliderCustomTheme(context),
                        child: Slider(
                          value: state.valueDimer,
                          onChanged: (newValue) {
                            //   print(newValue);
                            uplightBloc.add(Update(newValue));
                          },
                          min: 0,
                          max: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                MyPositioned.fill(
                  top:5 ,left: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title,style: MyTextStyle.estilo(18, MyColors.text),),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }



  Widget uplight_chico(){
    Color color;
    String text;
    return
      BlocBuilder<UpligthBloc,UplightState>(
          builder: ( context, state) {
            uplightBloc =  BlocProvider.of<UpligthBloc>(context);
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
                  uplightBloc.add(Disable());
                }else{
                  uplightBloc.add(Enable());
                }
              },
              child: MyContainer(
                margin: EdgeInsets.all(SC.all(5)),
                width: 66,
                height: 137,
                decoration: new BoxDecoration(
                  color: MyColors.baseColor,
                ),
                child: Stack(
                  children: <Widget>[
                    MyPositioned.fill(
                        top: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("UP", style: MyTextStyle.estiloBold(15, color),),
                        )
                    ),MyPositioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: iconSvgD("assets/icons/tira_led.svg", color, 45),
                        )
                    ),MyPositioned.fill(
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
