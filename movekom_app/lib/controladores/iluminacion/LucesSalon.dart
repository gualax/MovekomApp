
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/Utils/SizeConfig.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_salon_bloc.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/widgets/slider_theme.dart';


class LucesSalon extends StatelessWidget {
  final String title = "LUZ SALON";
  int widgetType;

  LucesSalon(this.widgetType);

  @override
  Widget build(BuildContext context) {
    final lucesSalonBloc = BlocProvider.of<LucesSalonBloc>(context);

    if(widgetType == 1){
      return bedroom_widget(lucesSalonBloc);
    }else {
      return _luz_bedroom_ww(lucesSalonBloc);
    }
  }


  Widget bedroom_widget(lucesSalonBloc){
    return
      BlocBuilder<LucesSalonBloc,LucesSalonState>(
          builder: ( context, state) {
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
                  right:20, bottom: 10,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconSvgD("assets/icons/salon.svg", Colors.lightGreenAccent.withAlpha(state.valueDimer.round()+20), 70),
                  ),
                ),
                MyPositioned.fill(
                  left: 30, bottom: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: iconSvgD("assets/icons/lampara.svg",  Colors.lightGreenAccent.withAlpha(state.valueDimer.round()+20), 55),
                  ),
                ),
                MyPositioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:  SC.hei(20),
                      child: SliderTheme(
                        data: sliderCustomTheme(context),
                        child: Slider(
                          value: state.valueDimer,
                          onChanged: (newValue) {
                            print(newValue);
                            lucesSalonBloc.add(Update(newValue));
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

  Widget _luz_bedroom_ww(lucesSalonBloc){
    return
      BlocBuilder<LucesSalonBloc,LucesSalonState>(
          builder: ( context, state) {
            return MyContainer(
              margin: EdgeInsets.all(SC.all(7)),
              width: 225,
              height: 140,
              decoration: new BoxDecoration(
                  color: MyColors.baseColor
              ),
              child: Stack(
                children: [
                  MyPositioned.fill(
                    right:20, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                        child: iconSvgD("assets/icons/salon.svg", MyColors.white, 70),
                    ),
                  ),
                  MyPositioned.fill(
                    left: 30, bottom: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: iconSvgD("assets/icons/lampara.svg", MyColors.white, 55),
                    ),
                  ),
                  MyPositioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:  SC.hei(20),
                        child: SliderTheme(
                          data: sliderWWCustomTheme(context),
                          child: Slider(
                            value: state.valueDimer,
                            onChanged: (newValue) {
                             // print(newValue);
                             // lucesSalonBloc.add(Update(newValue));
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




} /// Fin clase
